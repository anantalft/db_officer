class EditArticlesColumnsJrs <ActiveRecord::Migration
	def change
		rename_column :articles, :text, :text1
		change_column :articles, :text1, :text
	end
end
