require_dependency "db_officer/application_controller"
require 'rake'
require 'pry'

module DbOfficer
  class TablesController < ApplicationController
    def index
    end

    def create
      binding.pry
      @table = Table.new(params[:table])
      binding.pry
      path = Rails.root.join('db/migrate/')
        File.open(path + Generator.file_name_for_create(params[:table_name]),
        "w") do
        |file|
          file.write(Generator.create_table_script(params))
        end
        run_migration
      redirect_to main_index_path
    end

    def new
      @table = DbOfficer::Table.new(table_columns: [TableColumn.new])
      # @table.fields.build
      #
      # @fields = @table.fields
      #
      # respond_to do |format|
      #   format.html # new.html.erb
      #   format.json { render json: @table }
      # end
    end

    def migrate
    end

    private
    def run_migration
      %x[rake db:migrate]
    end

    # def table_params
    #   params.require(:table).permit(:name,:table_columns, table_columns_attributes: [:name, :field_type])
    # end

  end
end

