class ChangeClientsNameInClients <ActiveRecord::Migration
	def change
		change_column :clients, :clients_name, :text
		rename_column :clients, :clients_name, :clients_nam
	end
end
