class EditHumanColumnsGzw <ActiveRecord::Migration
	def change
		rename_column :human, :name1, :name1
		change_column :human, :name1, :string
		rename_column :human, :fame, :fame
		change_column :human, :fame, :string
		add_column :human, :dame, :text
	end
end
