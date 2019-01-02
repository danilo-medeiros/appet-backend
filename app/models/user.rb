class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # validations
  validates_presence_of %i[
    name
    email
    phone_number
    password_digest
    neighborhood
    city
    state
  ]

  # associations
  has_many :ads, foreign_key: :created_by, dependent: :destroy
end
