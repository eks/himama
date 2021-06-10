require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  let(:time_entry) { build(:time_entry) }

  describe '#validations' do
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
      it { expect(time_entry.errors.messages[:start_at]).to include("must be less than or equal to #{time_entry.end_at}") }
      it { expect(time_entry.errors.messages[:end_at]).to include("must be greater than or equal to #{time_entry.start_at}") }
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

  describe '#associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#in_progress?' do
    context 'when in progress' do
      before do
        time_entry.end_at = time_entry.start_at
      end

      it 'returns true' do
        expect(time_entry.in_progress?).to be_truthy
      end
    end

    context 'when not in progress' do
      it 'returns false' do
        expect(time_entry.in_progress?).to be_falsey
      end
    end
  end
end
