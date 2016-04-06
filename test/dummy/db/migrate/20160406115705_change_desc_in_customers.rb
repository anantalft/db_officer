class ChangeDescInCustomers <
ActiveRecord::Migration
	def change
		change_column :customers, :desc, :integer
		rename_column :customers, :desc, :descript
	end
end
