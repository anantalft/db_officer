module DbOfficer
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :tables
    def tables
      @tables = ActiveRecord::Base.connection.tables
    end
  end
end
