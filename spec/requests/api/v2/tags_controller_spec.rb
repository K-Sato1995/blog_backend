require 'rails_helper'

describe 'API::V2::TagsController' do
  let!(:tags) { 5.times { create(:tag) } }

  describe 'GET /api/v2/tags' do
    let(:json) { JSON.parse(response.body) }
    before { get '/api/v2/tags' }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'sends a list of posts' do
      expect(json['data'].size).to eq(1)
      expect(json['data']['tags'].length).to eq(5)
    end
  end
end
