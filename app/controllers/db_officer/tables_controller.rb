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
        path = Rails.root.join('db/migrate/')
        File.open(path + Generator.file_name_for_create(@table.name),
        "w") do
        |file|
          file.write(Generator.create_table_script(@table))
        end
        run_migration
        redirect_to main_index_path
      else
        render :new
      end
    end

    def new
      @table = DbOfficer::Table.new(table_columns: [TableColumn.new])
    end

    def migrate
    end

    private
    def run_migration
      %x[rake db:migrate]
    end


  end
end

