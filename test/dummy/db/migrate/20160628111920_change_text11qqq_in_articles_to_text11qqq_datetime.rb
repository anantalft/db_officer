class ChangeText11qqqInArticlesToText11qqqDatetime <ActiveRecord::Migration
	def change
		change_column :articles, :text11qqq, :datetime
		rename_column :articles, :text11qqq, :text11qqq
	end
end
