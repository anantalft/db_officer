class ChangeClientsInClients <
ActiveRecord::Migration
	def change
		change_column :clients, :clients, :text
		rename_column :clients, :clients, :clients_name
	end
end
