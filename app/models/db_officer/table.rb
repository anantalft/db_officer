module DbOfficer
  class Table < Tableless

   #attr_accessor :id, :table_name, :column_name, :column_type
    has_many :table_columns #, class_name: "TableColumn"
    accepts_nested_attributes_for :table_columns
    attr_accessor :id

    column :table_name, :string
    attr_accessor :table_name, :table_columns_attributes


    def id
      @id ||= 1
    end

    def self.app_table_columns(table_name)
      ActiveRecord::Base.connection.columns(table_name)
    end

    def self.app_tables
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
