class CreateOjash < ActiveRecord::Migration
  def change
    create_table :ojash do |t|
      t.string :name
      t.timestamps
    end
  end
end