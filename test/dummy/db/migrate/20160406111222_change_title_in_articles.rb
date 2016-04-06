class ChangeTitleInArticles <
ActiveRecord::Migration
	def change
		change_column :articles, :title, :integer
		rename_column :articles, :title, :titlename
	end
end
