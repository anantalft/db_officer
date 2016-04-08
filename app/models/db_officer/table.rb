module DbOfficer
  class Table
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :name,:table_columns,:skip_record_exist_validation
    validates :name, presence: true
    validates :table_columns, presence: true
    validate :record_already_exists?, unless: :skip_record_exist_validation
    validate :check_presence_of_table_column

    #https://coderwall.com/p/kvsbfa/nested-forms-with-activemodel-model-objects
    def table_columns_attributes=(attributes)
      @table_columns ||= []
      attributes.each do |i, table_column_params|
        @table_columns.push(TableColumn.new(table_column_params))
      end
    end

    def create_migration_file(path)
      Generator.create_migration_file(self,path)
    end

    def self.app_table_columns(table_name)
      ActiveRecord::Base.connection.columns(table_name)
    end


    def activerecord_columns
      table_cols = []
      table_columns =  Table.app_table_columns(self.name)
        Array(table_columns).each do |col|
          table_cols.push(TableColumn.new(name: col.name, field_type: col.sql_type, _destroy:""))
        end
      table_cols
    end

    def self.app_tables
      ActiveRecord::Base.connection.tables
    end

    def self.column_types
      [
      ["INTEGER", "integer"],
      ["STRING", "string"],
      ["TEXT", "text"],
      ["DATETIME", "datetime"],
      ["FLOAT", "float"],
      ["BOOLEAN", "boolean"],
      ]
    end

    private
    def record_already_exists?
      errors.add(:name, "already exists. Please provide different name.") if
      Table.app_tables.include?(name)
    end

    def check_presence_of_table_column
      if @table_columns
        Array(@table_columns).each do |table_column|
          if table_column._destroy != "1"
            if table_column.name.eql?('')
              errors.add(:table_columns, 'name cannot be blank.')
              break
            end
          end
        end
      end
    end


  end
end
