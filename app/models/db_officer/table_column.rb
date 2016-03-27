module DbOfficer
  class TableColumn
    include ActiveModel::Model
    attr_accessor :name,:field_type, :_destroy

  end
end
