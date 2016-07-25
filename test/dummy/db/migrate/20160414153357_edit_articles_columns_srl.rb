class EditArticlesColumnsSrl <ActiveRecord::Migration
	def change
		rename_column :articles, :text11q, :text11qq
		change_column :articles, :text11qq, :text
	end
end
