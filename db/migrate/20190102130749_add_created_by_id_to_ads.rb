class AddCreatedByIdToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :created_by, :integer
  end
end
