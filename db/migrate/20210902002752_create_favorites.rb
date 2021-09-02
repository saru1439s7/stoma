class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string "staff_id", null: false
      t.string "ostmy_id", null: false
      t.timestamps
    end
  end
end
