require 'pry'

module DbOfficer
  class TableColumnsController < DbOfficer::ApplicationController

    def index

    end
    def new
      # @table = DbOfficer::Table.new(name: params["table_id"], table_columns: [TableColumn.new])
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
     @table_column
     @table = DbOfficer::Table.new(name: table, table_columns: @table_column)
    end

    def update
      column_changed = params[:id]
      column_temp = TableColumn.new (params[:table_column])
      if column_temp.valid?
        table_name = params[:table_id]
        path = Utils.migration_file_root_path + Generator.file_name_for_column_change(table_name, column_changed,column_temp)
        Generator.create_change_column_file(table_name, column_changed,column_temp, path)
        if Utils.run_migration(path,column_temp)
          flash[:message] = "Table successfully updated."
          redirect_to root_path(table_name: table_name)
        else
          flash[:message] = "Error"
          redirect_to edit_table_table_column_path(table_id: params[:table_id], id: params[:id])
        end
      else
        flash[:message] = column_temp.errors.full_messages
        redirect_to edit_table_table_column_path(table_id: params[:table_id], id: params[:id])
      end

    end
  end
end
