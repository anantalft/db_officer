class ChangeTitlenameeeInArticlesToTitlenaneAnantaText <ActiveRecord::Migration
	def change
		change_column :articles, :titlenameee, :text
		rename_column :articles, :titlenameee, :titlenane_ananta
	end
end
