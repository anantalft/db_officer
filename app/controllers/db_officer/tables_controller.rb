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
        if !Utils.run_migration(path,@table)
          #render new_table_table_column_path()
          render :new
        else
          redirect_to root_path(table_name: @table.name)
        end
      else
        render :new
      end
    end

    def new
      @table = DbOfficer::Table.new(table_columns: [TableColumn.new])
    end

  end
end

