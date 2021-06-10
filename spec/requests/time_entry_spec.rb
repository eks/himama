require 'rails_helper'

RSpec.describe "TimeEntries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/time_entry/index"
      expect(response).to have_http_status(:success)
    end
  end
end
