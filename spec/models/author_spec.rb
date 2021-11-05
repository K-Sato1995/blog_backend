require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'Validation' do
    context 'When parameters are filled in with valid values' do
      let(:author) { build(:author) }

      it 'is valid with valid values' do
        expect(author).to be_valid
      end
    end

    context 'When parameters are not filled in with valid values' do
      let(:author1) { build(:author, name: '') }
      let(:author2) { build(:author, email: '') }
      let(:author3) { build(:author, password: '') }

      it 'is invalid without a name' do
        expect(author1).to_not be_valid
      end

      it 'is invalid without any content' do
        expect(author2).to_not be_valid
      end

      it 'is invalid without password' do
        expect(author3).to_not be_valid
      end
    end

    context 'Boundary value tests:' do
      let(:name) { build(:author, name: Faker::Lorem.characters(number: 51)) }
      let(:email) { build(:author, email: "#{Faker::Lorem.characters(number: 245)}@example.com") }
      let(:password) { build(:author, password: Faker::Lorem.characters(number: 5)) }

      it 'has to have a name that consists of less than 50 letters' do
        expect(name).to_not be_valid
      end

      it 'has to have an email that consists of less than 255 letters' do
        expect(email).to_not be_valid
      end

      it 'has to have a password that consists of more than 6 letters' do
        expect(password).to_not be_valid
      end
    end
  end
end
