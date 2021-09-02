class CreateOstomies < ActiveRecord::Migration[5.2]
  def change
    create_table :ostomies do |t|
      t.integer "patient_id", null: false
      t.integer "color", null: false
      t.integer "edema", null: false
      t.integer "skin", null: false
      t.string "h_size　"
      t.string "w_size"
      t.string "comment"
      t.string "image_id"
      t.timestamps
    end
  end
end
