class CreateTt < ActiveRecord::Migration
  def change
    create_table :tt do |t|
      t.integer :ff
      t.timestamps
    end
  end
end