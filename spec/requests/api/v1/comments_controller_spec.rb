require 'rails_helper'

describe 'API::V1::CommentsController' do
  let(:user) { create(:user) }

  describe 'POST /api/v1/posts/:post_id/comments' do
    let(:json) { JSON.parse(response.body) }
    let(:post1) { create(:post) }

    it 'creates a comment' do
      valid_params = { name: 'name', content: 'content' }
      expect { post "/api/v1/posts/#{post1.slug}/comments", params: { comment: valid_params } }.to change(Comment, :count).by(+1)
      expect(response.status).to eq(200)
    end
  end
end
