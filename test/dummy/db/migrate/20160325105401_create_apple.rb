class CreateApple < ActiveRecord::Migration
  def change
    create_table :apple do |t|
      t.integer :name
      t.timestamps
    end
  end
end