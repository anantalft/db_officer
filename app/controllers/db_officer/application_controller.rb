module DbOfficer
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :tables
    def tables
      @tables = Table.tables
    end
  end
end
