class CreateWorkflows < ActiveRecord::Migration
      def change
        create_table :workflows do |t|
          t.string :description
          t.timestamps
        end
      end
    end