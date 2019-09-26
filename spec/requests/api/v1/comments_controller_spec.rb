require 'rails_helper'

describe 'API::V2::CommentsController' do
  let(:user) { create(:user) }

  describe 'POST /api/v1/posts/:post_id/comments' do
    let(:json) { JSON.parse(response.body) }
    let(:post1) { create(:post) }
    let(:params) { { name: 'name', content: 'content' } }
    subject { post "/api/v1/posts/#{post1.slug}/comments", params: { comment: params } }

    context 'when the valid values are passed' do
      it 'creates a comment' do
        expect { subject }.to change(Comment, :count).by(+1)
        expect(response.status).to eq(200)
      end
    end

    context 'When the passed values are invalid' do
      let(:params) { { name: '', content: '' } }

      it 'returns an error' do
        expect { subject }.to change(Comment, :count).by(0)
        expect(json['message']).to eq('An error occured')
      end
    end
  end
end
