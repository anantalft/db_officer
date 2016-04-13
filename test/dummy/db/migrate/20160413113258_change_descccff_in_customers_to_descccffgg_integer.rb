class ChangeDescccffInCustomersToDescccffggInteger <ActiveRecord::Migration
	def change
		change_column :customers, :descccff, :integer
		rename_column :customers, :descccff, :descccffgg
	end
end
