require 'rails_helper'

describe 'Post', type: :model do
  let(:post) { build(:post) }

  describe 'validation' do
    let(:post1) { build(:post, title: '') }
    let(:post2) { build(:post, context: '') }

    it 'is invalid without a title' do
      expect(post1).to_not be_valid
    end

    it 'is invalid without any context' do
      expect(post2).to_not be_valid
    end
  end
end
