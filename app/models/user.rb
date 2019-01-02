class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # validations
  validates_presence_of :name, :email, :phone_number, :password_digest

  # associations
  has_many :ads, foreign_key: :created_id
end
