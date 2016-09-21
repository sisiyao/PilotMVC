require_relative '../config/db_connection'
require 'active_support/inflector'
require_relative 'associations'

class ModelBase
  extend Associations

  def self.columns
    query = <<-SQL
      SELECT *
      FROM #{self.table_name}
    SQL
    @col ||= DBConnection.execute2(query).first.map(&:to_sym)
  end

  # iterate through all columns in the table and define setter and getter methods for each.
  # store everything in the attributes hash.
  # it's important that the user of SQLObject call finalize! at the end
  # of their subclass definition, otherwise the getter/setter methods don't get defined.
  def self.finalize!
    self.columns.each do |col|
      define_method (col) do
        self.attributes[col]
      end

      define_method ("#{col}=") do |val|
        self.attributes[col] = val
      end
    end
  end

  #allows users to set the table name themselves
  #stores table_name as an instance variable on SQLObject. model classes will
  #eventually inherit from SQLObject, so table_name will be an instance variable on the class
  def self.table_name=(table_name)
    @table_name = table_name
  end

  #will set the table name using activesupport inflector library (part of rails)
  #if not already set
  def self.table_name
    @table_name ||= "#{self}".tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    obj = []
    results.each do |result|
      obj << self.new(result)
    end
    obj
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{self.table_name}
      WHERE id = ?
    SQL

    result.empty? ? nil : self.new(result.first)
  end

  def self.where(params)
    where_line = params.keys.map { |key| "#{key} = ?" }
    where_values = params.values

    results = DBConnection.execute(<<-SQL, *where_values)
      SELECT *
      FROM #{self.table_name}
      WHERE #{where_line.join(" AND ")}
    SQL

    parse_all(results)
  end

  def initialize(params = {})
    params.each do |attr_name, attr_value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)

      send("#{attr_name}=", attr_value)
    end
  end

  # ActiveRecord::Base gives us a handy method #attributes that hands
  # us a hash of all our model's columns and values.
  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |col_name| send(col_name) }
  end

  #make this private later
  def insert
    cols = self.class.columns.drop(1)
    col_names = cols.join(", ")
    question_marks = (["?"] * cols.count).join(", ")
    values = attribute_values.drop(1)

    DBConnection.execute(<<-SQL, *values)
      INSERT INTO #{self.class.table_name} (#{col_names})
      VALUES (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  #make this private later???
  def update
    cols = self.class.columns.drop(1)
    set = cols.map { |col| "#{col} = ?"}.join(", ")

    values = attribute_values.drop(1)

    DBConnection.execute(<<-SQL, *values, self.id)
      UPDATE #{self.class.table_name}
      SET #{set}
      WHERE id = ?
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
