class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :flight
      t.boolean :comedy
      t.boolean :action
      t.boolean :romance
      t.boolean :drama
      t.boolean :horror
      t.boolean :period

      t.timestamps null: false
    end
  end
end
