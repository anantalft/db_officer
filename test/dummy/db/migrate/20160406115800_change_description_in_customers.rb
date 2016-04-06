class ChangeDescriptionInCustomers <
ActiveRecord::Migration
	def change
		change_column :customers, :description, :text
		rename_column :customers, :description, :des
	end
end
