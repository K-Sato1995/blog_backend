require 'rails_helper'

describe 'API::V1::PostsController' do
  let(:user) { create(:user) }
  let!(:posts) { 5.times { create(:post) } }

  describe 'GET /en/api/v1/posts' do
    let(:json) { JSON.parse(response.body) }
    before { get '/en/api/v1/posts' }

    it 'returns 200' do
      expect(response).to be_success
    end

    it 'sends a list of posts' do
      expect(json['data'].length).to eq(4)
      expect(json['data']['posts'].length).to eq(5)
    end
  end

  describe 'GET /en/api/v1/posts/:id' do
    let(:post) { create(:post) }
    before { get "/en/api/v1/posts/#{post.id}" }

    it 'returns 200' do
      expect(response).to be_success
    end

    it 'sends a specific post' do
      expect(JSON.parse(response.body)['data']['title']).to eq(post.title)
    end
  end

  describe 'GET /en/api/v1/posts_list' do
    let(:json) { JSON.parse(response.body) }
    before { get '/en/api/v1/posts_list' }

    it 'returns 200' do
      expect(response).to be_success
    end

    it 'sends a list of posts' do
      expect(json['data'].length).to eq(5)
    end
  end

<<<<<<< HEAD
  describe 'PUT /en/api/v1/posts/:id/like' do
=======
  describe 'PUT /en/api/v1/:id/like' do
>>>>>>> Add test for like feature
    let!(:post) { create(:post) }

    before { put "/en/api/v1/posts/#{post.id}/like" }

    it 'adds 1 like' do
      expect(JSON.parse(response.body)['data']['like']).to eq(1)
    end
  end
end
