require 'rails_helper'

RSpec.describe TimeEntryHelper, type: :helper do
  let(:entry) { build(:time_entry) }

  describe '#end_time_helper' do
    context 'when entry is in progress' do
      it 'returns an empty string' do
        entry.end_at = entry.start_at
        expect(helper.end_time_helper(entry)).to eq('')
      end
    end

    context 'when entry is not in progress' do
      it 'returns formatted time string' do
        expect(helper.end_time_helper(entry)).to eq(Time.zone.at(entry.end_at).strftime('%H:%m:%S'))
      end
    end
  end

  describe '#duration_helper' do
    context 'when entry is in progress' do
      it 'returns an empty string' do
        entry.end_at = entry.start_at
        expect(helper.duration_helper(entry)).to eq('')
      end
    end

    context 'when entry is not in progress' do
      it 'returns formatted duration string' do
        expect(helper.duration_helper(entry)).to eq('4 hours')
      end
    end
  end
end
