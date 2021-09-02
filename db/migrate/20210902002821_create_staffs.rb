class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string "name", null: false
      #t.string "email", null: false
      t.string "image_id", null: false
      t.string "password", null: false
      t.timestamps
    end
  end
end
