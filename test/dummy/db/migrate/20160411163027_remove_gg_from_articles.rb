class RemoveGgFromArticles <ActiveRecord::Migration
	def change
		remove_column :articles, :gg
	end
end
