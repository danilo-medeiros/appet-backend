include Rails.application.routes.url_helpers

class Ad < ApplicationRecord
  attr_writer :user_id

  belongs_to :user, foreign_key: :created_by
  has_one_attached :picture

  enum pet_type: {
    dog: 0,
    cat: 1,
    bird: 2,
    fish: 3,
    others: 4
  }

  enum size: {
    p: 0,
    m: 1,
    g: 2,
    gg: 3
  }

  # validations
  validates_presence_of %i[
    title
    pet_type
    description
    size
    created_by
    city
    state
  ]

  ransacker :pet_type, formatter: proc {|v| pet_types[v]} do |parent|
    parent.table[:pet_type]
  end

  ransacker :size, formatter: proc {|v| sizes[v]} do |parent|
    parent.table[:size]
  end

  def user_id=(value)
    self.created_by = value
  end

  def picture_url
    rails_blob_path(self.picture, only_path: true) if self.picture.attached?
  end
end
