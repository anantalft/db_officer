class ChangeTitlenaneAnantaInArticlesToGgText <ActiveRecord::Migration
	def change
		change_column :articles, :titlenane_ananta, :text
		rename_column :articles, :titlenane_ananta, :gg
	end
end
