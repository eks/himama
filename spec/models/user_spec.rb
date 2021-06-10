require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'have a valid factory' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'validates email presence' do
      user = build(:user, email: nil)

      expect(user).to be_invalid
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'validates email uniqueness' do
      user = create(:user)
      invalid_user = build(:user, email: user.email)

      expect(invalid_user).to be_invalid
      expect(invalid_user.errors.messages[:email]).to include('has already been taken')
    end

    it 'validates email format' do
      user = build(:user, email: 'not.valid.email')

      expect(user).to be_invalid
      expect(user.errors.messages[:email]).to include('is invalid')
    end

    it 'downcase email' do
      user = create(:user, email: 'UPPERCASE@EMAIL.COM')

      expect(user.email).to eq('uppercase@email.com')
    end
  end

  describe '#full_name' do
    it 'has a full name' do
      user = build(:user)

      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end

  describe '#associations' do
    it { is_expected.to have_many(:time_entries) }
  end
end
