class ChangeBbbInAaaToBbbcInteger <ActiveRecord::Migration
	def change
		change_column :aaa, :bbb, :integer
		rename_column :aaa, :bbb, :bbbc
	end
end
