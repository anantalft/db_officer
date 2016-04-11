require 'pry'
require_dependency 'db_officer/utils'

module DbOfficer
  class TableColumnsController < DbOfficer::ApplicationController

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
    end

    def update
      column_changed = params[:id]
      @table_column = TableColumn.new(params[:table_column])
      if @table_column.valid?
        table_name = params[:table_id]
        path = Utils.migration_file_root_path + Generator.file_name_for_column_change(table_name, column_changed,@table_column)
        Generator.create_change_column_file(table_name, column_changed,@table_column, path)
        if Utils.run_migration(path,@table_column)
          flash[:message] = "Table successfully updated."
          redirect_to root_path(table_name: table_name)
        else
          render :edit
        end
      else
        render :edit
      end
    end

    def destroy
      binding.pry
      table = Table.new(name: params[:table_id])
      column_name = params[:id]
      path = Utils.migration_file_root_path + Generator.file_name_drop_table_column(table.name,column_name)
      Generator.create_drop_table_column_file(path,table.name,column_name)
      if Utils.run_migration(path,table)
        flash[:message] = "Table column successfully deleted."
      else
        flash[:message] = table.errors
      end
      redirect_to root_path(table_name: table.name)
    end
  end
end
