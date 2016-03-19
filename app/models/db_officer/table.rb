module DbOfficer
  class Table
    include ActiveModel::Validations
    attr_accessor :table_name, :column_name, :column_type
    validates_presence_of :table_name

    def self.columns(table_name)
      ActiveRecord::Base.connection.columns(table_name)
    end

    def self.tables
      ActiveRecord::Base.connection.tables
    end

    def self.column_types
      [
      ["INTEGER", "integer"],
      ["STRING", "string"],
      ["TEXT", "text"],
      ["DATETIME", "datetime"]
      ]
    end
  end
end
