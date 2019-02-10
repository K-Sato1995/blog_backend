require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe 'PostHelper' do
    describe 'Helper#posts_status' do
      it 'returns each size of post status' do
        expect(helper.posts_status).to eq(Draft: 0, Published: 0, Private: 0)
      end
    end

    describe 'Helper#chart_colors' do
      it 'returns the right color collection' do
        expect(helper.chart_colors).to eq(%w[#F1948A #D6EAF8 #F9E79F #EBF5FB #E6B0AA #D5F5E3])
      end
      it 'returns the right color collection' do
        expect(helper.chart_colors2).to eq(%w[#F9E79F #A3E4D7 #F1948A])
      end
    end

    describe 'Helper#error_check' do
      it 'retuns the correct error messages' do
        expect(helper.error_check(1)).to eq('There is 1 error.')
      end

      it 'retuns the correct error messages' do
        expect(helper.error_check(2)).to eq('There are 2 errors.')
      end
    end

    describe 'Helper#posts_data' do
      it 'returns a hash' do
        expect(helper.posts_data.class).to eq(Hash)
      end
    end

    describe 'Helper#initial_value' do
      it 'returns a text' do
        expect(helper.initial_value.class).to eq(String)
      end
    end
  end
end
