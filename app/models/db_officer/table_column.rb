module DbOfficer
  class TableColumn  < Tableless
    # include ActiveModel::Model
    # include ActiveModel::Associations
    belongs_to :table
    attr_accessor :id,:table_id
    # column :table_id, :integer
    column :field_type, :string
    column :name, :string
    column :required, :string
    column :id, :integer
    column :table_id, :integer

    def id
      @id ||= 1
    end

    def table_id
      @table_id ||= 1
    end
  end
end
