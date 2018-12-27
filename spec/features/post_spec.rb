require 'rails_helper'

feature 'Posts', type: :feature do
  describe 'The order of posts' do
    before(:all) do
      create(:post, title: 'post_2019_12_01', score: 5, created_at: Time.new(2019, 12, 01), category: create(:category, name: 'JS'))
      create(:post, title: 'post_2019_12_02', score: 5, created_at: Time.new(2019, 12, 02))
      create(:post, title: 'post_2019_12_03', score: 2, created_at: Time.new(2019, 12, 03))
    end

    after(:all) do
      Post.delete_all
    end

    it 'should be sorted based on the score of each post. If multiple posts have the same score, those posts should be sorted dscendingly by created date of each post' do
      visit '/en'
      expect(all('.box')[0]).to have_content('post_2019_12_02')
      expect(all('.box')[1]).to have_content('post_2019_12_01')
      expect(all('.box')[2]).to have_content('post_2019_12_03')
    end
  end

  describe 'Selected Category' do
    before(:all) do
      create(:post, category: create(:category, name: 'JS'))
      create(:post)
      create(:post)
    end

    before(:each) do
      visit '/en'
      click_link 'JS'
    end

    after(:all) do
      Post.delete_all
    end

    it 'should only show posts with the selected cateogory' do
      expect(all('.box').size).to eq(1)
    end

    it 'should have the selected category' do
      expect(all('.box')[0]).to have_content('JS')
    end
  end
end
