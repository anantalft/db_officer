class ChangeNameInApple <ActiveRecord::Migration
	def change
		change_column :apple, :name, :integer
		rename_column :apple, :name, :name_fame
	end
end
