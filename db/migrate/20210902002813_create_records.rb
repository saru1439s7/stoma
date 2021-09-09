class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :patient_id, null: false
      t.integer :adjacent, null: false
      t.integer :barrier, null: false
      t.integer :circumscribing, null: false
      t.integer :discolor, null: false
      t.string :h_size
      t.string :w_size
      t.string :d_size
      t.string :comment
     
      t.timestamps
    end
  end
end
