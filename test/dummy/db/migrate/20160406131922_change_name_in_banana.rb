class ChangeNameInBanana <ActiveRecord::Migration
	def change
		change_column :banana, :name, :integer
		rename_column :banana, :name, :name
	end
end
