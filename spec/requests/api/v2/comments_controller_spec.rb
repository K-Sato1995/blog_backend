require 'rails_helper'

describe 'API::V2::CommentsController' do
  let(:user) { create(:user) }

  describe 'POST /api/v2/posts/:post_id/comments' do
    let(:json) { JSON.parse(response.body) }
    let(:post1) { create(:post) }

    context 'when the valid values are passed' do
      valid_params = { name: 'name', content: 'content' }

      it 'creates a comment' do
        expect { post "/api/v2/posts/#{post1.slug}/comments", params: { comment: valid_params } }.to change(Comment, :count).by(+1)
        expect(response.status).to eq(200)
      end
    end

    # context 'When the passed values are invalid' do
    #   let!(:invalid_params) do
    #     {
    #       comment: { name: '', content: '' }
    #     }
    #   end
    #   it 'returns an error' do
    #     expect { post "/api/v2/posts/#{post1.slug}/comments", params: invalid_params }.to change(Comment, :count).by(+1)
    #   end
    # end
  end
end
