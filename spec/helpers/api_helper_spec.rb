require 'rails_helper'

RSpec.describe ApiHelper, type: :helper do
  before { class K; include ApiHelper; end }
  let(:ins) { K.new }

  describe 'Api helper methods' do
    describe 'show_attributes' do
      it 'only shows speficfied attributes' do
        expect(ins.show_attributes).to eq(%w[id title content status created_at updated_at user_id category_id score page_views introduction language like slug])
      end
    end

    describe 'index_attributes' do
      it 'only shows speficfied attributes' do
        expect(ins.index_attributes).to eq(%w[id title category_id score introduction language like slug])
      end
    end

    describe 'featured_posts_attributes' do
      it 'only shows speficfied attributes' do
        expect(ins.featured_posts_attributes).to eq(%w[id title slug])
      end
    end
  end
end
