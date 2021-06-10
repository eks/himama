require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  describe '#validations' do
    let(:time_entry) { build(:time_entry) }

    it 'have a valid factory' do
      expect(time_entry).to be_valid
    end

    context 'when start_at is greater than end_at' do
      before do
        time_entry.start_at = 2
        time_entry.end_at = 1
        time_entry.valid?
      end

      it { expect(time_entry).to be_invalid }
      it { expect(time_entry.errors.messages[:start_at]).to include("must be less than #{time_entry.end_at}") }
      it { expect(time_entry.errors.messages[:end_at]).to include("must be greater than #{time_entry.start_at}") }
    end

    context 'when there is no day' do
      before do
        time_entry.day = nil
        time_entry.valid?
      end

      it { expect(time_entry).to be_invalid }
      it { expect(time_entry.errors.messages[:day]).to include("can't be blank") }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
