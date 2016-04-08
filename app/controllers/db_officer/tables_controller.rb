require_dependency "db_officer/application_controller"
require 'pry'
require_dependency 'db_officer/utils'
module DbOfficer
  class TablesController < ApplicationController
    def index
    end

    def create
      @table = Table.new(params[:table])
      if @table.valid?
        path = Utils.migration_file_root_path + Generator.file_name_for_create(@table.name)
        @table.create_migration_file(path)
        if Utils.run_migration(path,@table)
          redirect_to root_path(table_name: @table.name)
        else
          render :new
        end
      else
        render :new
      end
    end

    def new
      @table = DbOfficer::Table.new(table_columns: [TableColumn.new])
    end

    def edit
       table_name = params[:id]
       table_cols = Table.app_table_columns(table_name)
       table_columns = []
       Array(table_cols).each do |col|
         table_columns.push(TableColumn.new(name: col.name, field_type: col.sql_type))
       end
      @table = Table.new(name: table_name, table_columns:table_columns)
    end

    def update
      @table= Table.new(params[:table])
      @table.skip_record_exist_validation = true
      if @table.valid?
        org_table_columns = @table.activerecord_columns
        class_suffix = Utils.rand_string
        path = Utils.migration_file_root_path + Generator.file_name_edit_table(@table.name,class_suffix)
        Generator.create_edit_table_file(path,@table,org_table_columns, class_suffix)
        if Utils.run_migration(path,@table)
          flash[:message] = "Table successfully updated."
          redirect_to root_path(table_name: params[:id])
        else
          render :edit
        end
      else
        render :edit
      end
    end

    def destroy
      #TODO
    end
  end
end

