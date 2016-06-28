class ChangeNameInHumanToName1String <ActiveRecord::Migration
	def change
		change_column :human, :name, :string
		rename_column :human, :name, :name1
	end
end
