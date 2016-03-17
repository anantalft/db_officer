module DbOfficer
  class Table
    def columns(table_name)
      ActiveRecord::Base.connection.columns(table_name)
    end
  end
end
