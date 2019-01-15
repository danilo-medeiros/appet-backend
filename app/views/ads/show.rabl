object @ad
attributes :id, :title, :pet_name, :pet_type, :description, :weight, :neighborhood, :postal_code, :city, :state, :size, :picture_url, :created_at, :updated_at, :aprox_age

child(:user) do
  attributes :id, :name, :phone_number
end
