class RemoveBbbcdFromAaa <ActiveRecord::Migration
	def change
		remove_column :aaa, :bbbcd
	end
end
