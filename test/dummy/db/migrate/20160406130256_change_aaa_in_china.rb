class ChangeAaaInChina <ActiveRecord::Migration
	def change
		change_column :china, :aaa, :integer
		rename_column :china, :aaa, :aaa
	end
end
