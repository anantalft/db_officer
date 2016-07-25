class EditArticlesColumnsXee <ActiveRecord::Migration
	def change
		rename_column :articles, :text11, :text11q
		change_column :articles, :text11q, :text
	end
end
