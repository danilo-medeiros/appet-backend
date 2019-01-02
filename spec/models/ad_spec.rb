require 'rails_helper'

RSpec.describe Ad, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:pet_type) }
  it { should validate_presence_of(:size) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:created_by) }

  it { should belong_to(:user) }
end