class EditAaaColumnsJsn <ActiveRecord::Migration
	def change
		rename_column :aaa, :bbbc, :bbbcd
		change_column :aaa, :bbbcd, :integer
	end
end
