require 'rails_helper'

describe 'API::V2::CategoriesController' do
  let!(:categories) { 5.times { create(:category) } }

  describe 'GET /api/v2/categories' do
    let(:json) { JSON.parse(response.body) }
    before { get '/api/v2/categories' }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'sends a list of posts' do
      expect(json['data'].size).to eq(1)
      expect(json['data']['categories'].length).to eq(5)
    end
  end
end
