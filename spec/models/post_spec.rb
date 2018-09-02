require 'rails_helper'

describe 'Post', type: :model do
  let(:post) { FactoryBot.create(:post) }

  it 'creates a post' do
    expect(post.title).to eq('Title')
    expect(post.context).to eq('This is the context of this post')
  end

end
