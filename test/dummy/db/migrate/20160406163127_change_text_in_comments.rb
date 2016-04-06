class ChangeTextInComments <ActiveRecord::Migration
	def change
		change_column :comments, :text, :text
		rename_column :comments, :text, :texttt
	end
end
