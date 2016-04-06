class ChangeDescriptInCustomers <
ActiveRecord::Migration
	def change
		change_column :customers, :descript, :integer
		rename_column :customers, :descript, :description
	end
end
