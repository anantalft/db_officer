class CreateRr < ActiveRecord::Migration
  def change
    create_table :rr do |t|
      t.integer :rr
      t.timestamps
    end
  end
end