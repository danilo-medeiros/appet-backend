class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :postal_code
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :password_digest

      t.timestamps
    end
  end
end
