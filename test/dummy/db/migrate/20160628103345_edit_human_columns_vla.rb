class EditHumanColumnsVla <ActiveRecord::Migration
	def change
		rename_column :human, :name1, :name1
		change_column :human, :name1, :string
		rename_column :human, :fame, :fame
		change_column :human, :fame, :string
	end
end
