require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    query = <<-SQL
      SELECT *
      FROM #{self.table_name}
    SQL
    @col ||= DBConnection.execute2(query).first.map(&:to_sym)
  end

  # it's important that the user of SQLObject call finalize!
  # at the end of their subclass definition, otherwise the getter/setter methods don't get defined.
  def self.finalize!
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
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
