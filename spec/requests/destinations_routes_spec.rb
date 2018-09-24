require 'rails_helper'


describe 'the API process for destinations' do
  context'get all destinations route', :type => :request do
    let!(:destinations) { FactoryBot.create_list(:destination, 20)}

    before { get '/destinations' }

    it 'returns all destinations' do
      expect(parse_json(response).size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'post all destinations route', :type => :request do

    before do
      post '/destinations', params: {:city => 'test_city', :country => 'test_country', :description => 'test_description' }
    end

    it 'returns the city' do
      expect(parse_json(response)['city']).to eq ('test_city')
    end

    it 'returns the country' do
      expect(parse_json(response)['country']).to eq ('test_country')
    end

    it 'returns the description' do
      expect(parse_json(response)['description']).to eq ('test_description')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end
end
