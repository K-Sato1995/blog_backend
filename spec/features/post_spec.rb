require 'rails_helper'

feature 'Posts', type: :feature do
  describe 'The order of posts' do
    let(:post1) { build(:post, title: 'post_2019_12_01', score: 5, created_at: Time.new(2019, 12, 01)) }
    let(:post2) { build(:post, title: 'post_2019_12_02', score: 5, created_at: Time.new(2019, 12, 02)) }
    let(:post3) { build(:post, title: 'post_2019_12_03', score: 2, created_at: Time.new(2019, 12, 03)) }

    it 'should be sorted based on the score of each post. If multiple posts have the same score, those posts should be sorted dscendingly by created date of each post' do
      visit '/en'
      expect(all('.box')[0]).to have_content('post_2019_12_02')
      expect(all('.box')[1]).to have_content('post_2019_12_01')
      expect(all('.box')[2]).to have_content('post_2019_12_03')
    end
  end
end
