require 'rails_helper'

describe 'API::V1::CommentsController' do
  let(:user) { create(:user) }

  describe 'POST /api/v1/posts/:post_id/comments' do
    let(:json) { JSON.parse(response.body) }
    let(:post1) { create(:post) }
    let!(:valid_params) do
      {
        comment: { name: 'name', content: 'content' }
      }
    end

    it 'creates a comment' do
      expect { post "/api/v1/posts/#{post1.id}/comments", params: valid_params }.to change(Comment, :count).by(+1)
      expect(response.status).to eq(200)
    end
  end
end
