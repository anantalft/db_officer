require_dependency "db_officer/application_controller"

module DbOfficer
  class MainController < ApplicationController
    def index
      if params[:table_name]
       @columns = ActiveRecord::Base.connection.columns(params[:table_name])
      end
    end
  end
end
