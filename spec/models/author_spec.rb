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

  describe '.digest' do
    subject { Author.digest('my password') }

    it 'Returns the hash value of the given string' do
      expect(subject.size).to eq(60)
    end

    it 'Returns true if it matches the given string' do
      expect(subject).to eq('my password')
    end

    it 'Returns false if it dose not match the given string' do
      expect(subject).not_to eq('not my password')
    end
  end

  describe '.generate_token' do
    subject { Author.generate_token }

    it 'returns a random URL-safe base64 string' do
      expect(subject).to be_kind_of(String)
    end
  end

  describe '#remember' do
    let!(:author) { create(:author) }

    it 'updates remember_token' do
      expect { author.remember }.to change(author, :remember_token)
    end
  end

  describe '#authenticated?' do
    let(:author) { create(:author) }
    before { author.remember }

    it 'check if the given value matches the one stored in DB' do
      expect(author.authenticated?(author.remember_token)).to be_truthy
    end
  end

  describe '#forget' do
    let(:author) { create(:author) }
    before { author.remember }

    it 'sets remember_token to nil' do
      expect { author.forget }.to change(author, :remember_digest).to(nil)
    end
  end
end
