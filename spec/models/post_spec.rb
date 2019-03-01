require 'rails_helper'

describe 'Post', type: :model do
  let(:post) { build(:post) }

  describe 'Validation' do
    context 'When parameters are filled in with valid values' do
      let(:post) { build(:post) }

      it 'is valid with valid values' do
        expect(post).to be_valid
      end
    end

    context 'When parameters are not filled in with valud values' do
      let(:post1) { build(:post, title: '') }
      let(:post2) { build(:post, context: '') }
      let(:post3) { build(:post, category_id: '') }

      it 'is invalid without a title' do
        expect(post1).to_not be_valid
      end

      it 'is invalid without any context' do
        expect(post2).to_not be_valid
      end

      it 'is invalid without any category' do
        expect(post3).to_not be_valid
      end
    end

    context 'score must be between 1 and 10' do
      let(:post1) { build(:post, score: 0) }
      let(:post2) { build(:post, score: 11) }

      it 'would be invalid if the score is lower than 1' do
        expect(post1).to_not be_valid
      end

      it 'would be invalid if the score is higher than 10' do
        expect(post2).to_not be_valid
      end
    end
  end

  describe 'Post.search' do
    let!(:posts) { create_list(:post, 10) }

    it 'only returns searced posts' do
      expect(Post.search(title: posts.first.title)[0]).to eq(posts[0])
    end

    it 'only returns searced posts' do
      expect(Post.search(category: posts.first.category_id)[0]).to eq(posts[0])
    end

    it 'returns all without tile and category parameter' do
      expect(Post.search.size).to eq(10)
    end
  end

  describe 'Post.status_check' do
    let!(:drafts) { create_list(:post, 10, status: 0) }
    let!(:published_posts) { create_list(:post, 10, status: 1) }
    let!(:private_posts) { create_list(:post, 10, status: 2) }

    it 'only returns published posts' do
      expect(Post.status_check(status: 'published').size).to eq(10)
    end

    it 'only returns private posts' do
      expect(Post.status_check(status: 'draft').size).to eq(10)
    end

    it 'only returns drafts' do
      expect(Post.status_check(status: 'confidential').size).to eq(10)
    end
  end
end
