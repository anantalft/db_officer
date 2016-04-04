require_dependency "db_officer/application_controller"
require 'rake'
require 'pry'

module DbOfficer
  class TablesController < ApplicationController
    def index
    end

    def create
      @table = Table.new(params[:table])
      if @table.valid?
        path = Rails.root.join('db/migrate/') + Generator.file_name_for_create(@table.name)
        @table.create_migration_file(path)
        if !run_migration(path)
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

    private
    def run_migration(file_path)
     # %x[rake db:migrate]
      begin
        ActiveRecord::Migrator.migrate "db/migrate"
      rescue Exception=> exception
        File.delete(file_path)
        @table.errors.add(:name,exception)
      end
    end


  end
end

