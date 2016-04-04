module DbOfficer
  class TableColumn
    include ActiveModel::Model
    include ActiveModel::Validations
    attr_accessor :name,:field_type, :_destroy

    validates :name, presence: true
    validates :field_type, presence: true
  end
end
