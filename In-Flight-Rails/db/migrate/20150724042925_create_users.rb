class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :flight
      t.boolean :aaction
      t.boolean :comedy
      t.boolean :romance

      t.timestamps null: false
    end
  end
end
