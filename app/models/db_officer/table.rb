module DbOfficer
  class Table
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :name,:table_columns
    validates :name, presence: true

    #https://coderwall.com/p/kvsbfa/nested-forms-with-activemodel-model-objects
    def table_columns_attributes=(attributes)
      @table_columns ||= []
      attributes.each do |i, table_column_params|
        @table_columns.push(TableColumn.new(table_column_params))
      end
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
