class EditArticlesColumnsTjf <ActiveRecord::Migration
	def change
		rename_column :articles, :text1, :text11
		change_column :articles, :text11, :text
	end
end
