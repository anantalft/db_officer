class EditCustomersColumnsYpd <ActiveRecord::Migration
	def change
		rename_column :customers, :ccc, :cccd
		change_column :customers, :cccd, :integer
	end
end
