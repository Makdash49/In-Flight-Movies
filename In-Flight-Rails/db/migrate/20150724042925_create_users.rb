class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :flight, index: true, foreign_key: true
      t.boolean :aaction
      t.boolean :comedy
      t.boolean :romance

      t.timestamps null: false
    end
  end
end
