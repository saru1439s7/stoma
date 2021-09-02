class CreateDialies < ActiveRecord::Migration[5.2]
  def change
    create_table :dialies do |t|
        t.integer "patient_id", null: false
        t.string "weight", null: false
        t.string "bp", null: false
        t.string "bt"
        t.string "bs"
        t.integer "color　"
        t.integer "amount"
        t.integer "feeling"
        t.string "comment"
        t.string "image_id"
        t.timestamps
    end
  end
end
