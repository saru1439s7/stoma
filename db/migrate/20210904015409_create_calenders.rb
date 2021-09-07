class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|
      t.integer :patient_id, null: false
      t.string :title
      t.text :body
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end