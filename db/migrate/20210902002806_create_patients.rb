class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      #t.string "name", null: false
      #t.string "name_kana", null: false
      #t.string "email", null: false
      t.string "image_id", null: false
      t.string "password", null: false
      t.timestamps
    end
  end
end
