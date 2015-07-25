class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
