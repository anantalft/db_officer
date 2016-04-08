class ChangeTextInArticlesToTextText <ActiveRecord::Migration
	def change
		change_column :articles, :text, :text
		rename_column :articles, :text, :text
	end
end
