require_relative '03_associatable'

module Associatable
  def has_one_through(name, through_name, source_name)
    p self
    through_options = self.assoc_options[through_name]

    define_method(name) do
      source_options = through_options.model_class.assoc_options[source_name]

      results = DBConnection.execute(<<-SQL)
        SELECT #{source_options.table_name}.*
        FROM #{through_options.table_name}
        JOIN #{source_options.table_name}
        ON #{through_options.table_name}.#{source_options.foreign_key}
          = #{source_options.table_name}.#{source_options.primary_key}
        WHERE #{through_options.table_name}.#{through_options.primary_key}
          = #{send(through_options.foreign_key)}
      SQL

      self.class.parse_all(results)
    end
  end
end
