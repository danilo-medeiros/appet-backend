class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :pet_name
      t.integer :pet_type
      t.text :description
      t.integer :aprox_age
      t.float :weight
      t.integer :size
      t.string :neighborhood
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
