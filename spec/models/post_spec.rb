require 'rails_helper'

describe 'Post', type: :model do
  let(:post) { FactoryBot.create(:post) }
  let(:post1) { FactoryBot.create(:post, title: '') }

  it 'creates a post' do
    expect(post.title).to eq('Title')
    expect(post.context).to eq('This is the context of this post')
  end

  it 'validates presnce' do
    expect(post1.errors[:title]).to include("can't be blank")
  end
end
