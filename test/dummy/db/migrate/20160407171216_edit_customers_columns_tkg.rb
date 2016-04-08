class EditCustomersColumnsTkg <ActiveRecord::Migration
	def change
		rename_column :customers, :desccc, :descccff
		change_column :customers, :descccff, :integer
		add_column :customers, :bbb, :integer
		add_column :customers, :ccc, :integer
	end
end
