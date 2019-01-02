class Ad < ApplicationRecord
  enum pet_type: { dog: 0, cat: 1, bird: 2, fish: 3, others: 4 }
  enum size: { p: 0, m: 1, g: 2, gg: 3 }

  # validations
  validates_presence_of :title, :pet_type, :size
end
