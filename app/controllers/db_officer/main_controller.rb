require_dependency "db_officer/application_controller"

module DbOfficer
  class MainController < ApplicationController
    def index
      @tables = ActiveRecord::Base.connection.tables
    end
  end
end
