require_dependency "db_officer/application_controller"
require 'rake'
require 'pry'

module DbOfficer
  class TableColumnsController < ApplicationController
    def index

    end
    def new
    end

    def edit
     table = params["table_id"]
     table_columns = Table.app_table_columns(table)
     @table_column = TableColumn.new
     Array(table_columns).each do |col|
       if col.name == params["id"]
        @table_column.name = col.name
        @table_column.field_type = col.sql_type
       end
     end
      @table = DbOfficer::Table.new(name: table, table_columns: @table_column)
    end

    def update

    end
  end
end
