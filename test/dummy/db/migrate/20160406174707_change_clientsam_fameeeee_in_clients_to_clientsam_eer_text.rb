class ChangeClientsamFameeeeeInClientsToClientsamEerText <ActiveRecord::Migration
	def change
		change_column :clients, :clientsam_fameeeee, :text
		rename_column :clients, :clientsam_fameeeee, :clientsam_eer
	end
end
