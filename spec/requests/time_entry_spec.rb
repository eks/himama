require 'rails_helper'

RSpec.describe 'TimeEntries', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:time_entry) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get "/time_entries"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_time_entry_url(create(:time_entry, user: user))
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'creates a new TimeEntry' do
      expect do
        post time_entries_url
      end.to change(TimeEntry, :count).by(1)
    end

    it 'redirects to the created time_entry' do
      post time_entries_url
      expect(response).to redirect_to(time_entries_url)
    end

    it 'updates end_at' do
      time_entry = create(:time_entry, user: user, start_at: 1623369600, end_at: 1623369600)
      post time_entries_url
      time_entry.reload
      expect(time_entry.end_at).to be > 1623369600
    end
  end

  describe 'PATCH /update' do
    let(:new_attributes) do
      { start_time: '00:00:01', end_time: '00:00:05' }
    end
    let(:invalid_attributes) do
      { start_time: '00:00:05', end_time: '00:00:01' }
    end

    it 'updates the requested time_entry' do
      time_entry = create(:time_entry, user: user, start_at: 1623369600, end_at: 1623369602 )

      patch time_entry_url(time_entry), params: { time_entry: new_attributes }
      time_entry.reload
      expect(time_entry.start_at).to eq(1623369601)
      expect(time_entry.end_at).to eq(1623369605)
      expect(response).to redirect_to(time_entries_url)
    end

    it 'does not update the time_entry' do
      time_entry = create(:time_entry, user: user, start_at: 1623369600, end_at: 1623369602 )

      patch time_entry_url(time_entry), params: { time_entry: invalid_attributes }
      time_entry.reload
      expect(time_entry.start_at).to eq(1623369600)
      expect(time_entry.end_at).to eq(1623369602)
    end
  end
end
