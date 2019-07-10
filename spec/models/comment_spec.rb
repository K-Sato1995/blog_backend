require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validation' do
    context 'When parameters are filled in with valid values' do
      let(:comment) { build(:comment) }

      it 'is valid with valid values' do
        expect(comment).to be_valid
      end
    end

    context 'When parameters are not filled in with valud values' do
      let(:comment1) { build(:comment, name: '') }
      let(:comment2) { build(:comment, content: '') }

      it 'is invalid without a name' do
        expect(comment1).to_not be_valid
      end

      it 'is invalid without any content' do
        expect(comment2).to_not be_valid
      end
    end
  end
end
