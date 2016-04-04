require_dependency "db_officer/application_controller"

module DbOfficer
  class MainController < ApplicationController
    def index
      if params[:table_name]
        @columns = Table.app_table_columns(params[:table_name])
      else
        @tables = Table.app_tables
      end
    end
  end
end
