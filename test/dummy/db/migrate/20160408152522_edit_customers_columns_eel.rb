class EditCustomersColumnsEel <ActiveRecord::Migration
	def change
		remove_column :customers, :bbb, :integer
	end
end
