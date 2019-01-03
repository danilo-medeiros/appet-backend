require 'rails_helper'

RSpec.describe 'Ads resource', type: :request do
  let!(:ads) { create_list(:ad, 5) }

  describe 'GET /ads' do
    before { get '/ads' }

    it 'should return ads' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end

  describe 'GET /ads/:id' do
    let!(:ad) { create(:ad, id: 100) }

    before { get '/ads/100' }

    it 'should return one object' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(100)
    end
  end

  describe 'POST /ads' do
    let!(:params) do
      {
        title: Faker::Lorem.word,
        title: Faker::Lorem.word,
        pet_type: rand(0..4),
        size: rand(0..3),
        description: Faker::Lorem.sentence(3),
        created_by: 9,
        city: Faker::Address.city,
        state: Faker::Address.state
      }
    end

    before { post '/ads', params: params }
    
    it 'should return the created ad' do
      expect(json).not_to be_empty
      expect(response).to have_http_status(:created)
    end
  end
end