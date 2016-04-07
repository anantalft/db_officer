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

    def edit
       table_name = params[:id]
       table_cols = Table.app_table_columns(table_name)
       table_columns = []
       Array(table_cols).each do |col|
         table_columns.push(TableColumn.new(name: col.name, field_type: col.sql_type))
       end
      @table = Table.new(name: table_name, table_columns:table_columns)
    end

    def update
      table= Table.new(params[:table])
      org_table_columns = table.activerecord_columns
      file = Generator.file_name_edit_table(table.name)
      path = Rails.root.join('test/test_files') + file
     # path = Utils.migration_file_root_path + Generator.file_name_edit_table
     # (table.name)
      Generator.create_edit_table_file(path,table,org_table_columns)

      # if table.valid?
      #   path = Utils.migration_file_root_path + Generator.file_name_edit_table(table.name)
      #   Generator.create_edit_table_file(path,table,org_table_columns)
      #   binding.pry
      # else
      #   #render :edit
      # end
      redirect_to root_path(table_name: params[:id])
    end
  end
end

#
# => #<DbOfficer::Table:0x007f6f301c9610
# @name="dustomers",
# @table_columns=
# [#<DbOfficer::TableColumn:0x007f6f301c9200 @_destroy="", @field_type="integer", @name="id">,
# #<DbOfficer::TableColumn:0x007f6f301c9110 @_destroy="", @field_type="integer", @name="abc">,
# #<DbOfficer::TableColumn:0x007f6f301c9020 @_destroy="1", @field_type="integer", @name="bbc">,
# #<DbOfficer::TableColumn:0x007f6f301c8f30 @_destroy="", @field_type="integer", @name="ccb">,
# #<DbOfficer::TableColumn:0x007f6f301c8e40 @_destroy="", @field_type="datetime", @name="created_at">,
# #<DbOfficer::TableColumn:0x007f6f301c8d50 @_destroy="", @field_type="datetime", @name="updated_at">,
# #<DbOfficer::TableColumn:0x007f6f301c8c60 @_destroy="", @field_type="integer", @name="jpt">,
# #<DbOfficer::TableColumn:0x007f6f301c8b70 @_destroy="", @field_type="integer", @name="jpt1">]>
