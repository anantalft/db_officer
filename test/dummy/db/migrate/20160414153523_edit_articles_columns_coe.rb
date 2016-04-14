class EditArticlesColumnsCoe <ActiveRecord::Migration
	def change
		rename_column :articles, :text11qq, :text11qqq
		change_column :articles, :text11qqq, :text
	end
end
