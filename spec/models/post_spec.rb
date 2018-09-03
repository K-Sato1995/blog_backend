require 'rails_helper'

describe 'Post', type: :model do
  let(:post) { build(:post) }
  let(:post1) { build(:post, title: '') }

  it 'creates a post' do
    expect(post.title).to eq('Title')
    expect(post.context).to eq('This is the context of this post')
  end

  it 'validates presnce of the title' do
    expect(post1).to_not be_valid
  end
end
