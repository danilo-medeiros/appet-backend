require 'rails_helper'

describe 'Ads resource', type: :request do
  let!(:ads) { create_list(:ad, 5) }

  describe 'GET /ads' do
    before { get '/ads' }
    
    it 'should return ads' do
      expect(json['ads']).not_to be_empty
      expect(json['ads'].size).to eq(5)
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

  context 'authorized' do
    let!(:user) { create(:user) }
    let!(:token) { authenticate user }

    describe 'POST /ads' do
      let!(:params) do
        {
          title: Faker::Lorem.word,
          pet_type: 'dog',
          size: 'p',
          description: Faker::Lorem.sentence(3),
          created_by: 9,
          city: Faker::Address.city,
          state: Faker::Address.state
        }
      end
  
      before { post '/ads', params: params, headers: { Authorization: token } }
      
      it 'should return the created ad' do
        expect(json).not_to be_empty
        expect(response).to have_http_status(:created)
      end
    end

    describe 'PUT /ads/:id' do
      let!(:ad) { create(:ad, user_id: user.id) }

      before { put "/ads/#{user.id}", params: { ad: ad }, headers: { Authorization: token } }

      it 'should return the updated ad' do
        expect(json).not_to be_empty
        expect(response).to have_http_status(:ok)
        expect(json['id']).to eq(user.id)
      end
    end
  end

  context 'unauthorized' do
    describe 'POST /ads' do
      let!(:user) { create(:user) }

      describe 'POST /ads' do
        let!(:params) do
          {
            title: Faker::Lorem.word,
            pet_type: 'dog',
            size: 'p',
            description: Faker::Lorem.sentence(3),
            created_by: 9,
            city: Faker::Address.city,
            state: Faker::Address.state
          }
        end
    
        before { post '/ads', params: params }
        
        it 'should return the created ad' do
          expect(response.body).to be_empty
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end