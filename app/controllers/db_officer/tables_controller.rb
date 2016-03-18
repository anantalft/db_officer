require_dependency "db_officer/application_controller"

module DbOfficer
  class TablesController < ApplicationController
    def index

    end

    def create
      path = Rails.root.join('db/migrate/')
      File.open(path + file_name(params[:table_name]), "w") do
      |file|
        file.write("adding first line of text")
      end
    end

    def new
    end

    private
    def file_name(table_name)
      datenow = DateTime.now.strftime("%Y%m%d%H%M%S")
      "#{datenow}_create_#{table_name}.rb"
    end

    def create_table(table_params)
      ""
    end

  end
end




