require 'rails_helper'

RSpec.describe "Dashbords", type: :request do
  describe "GET /dashbord" do
    it "returns http success" do
      get "/dashbord"
      expect(response).to have_http_status(:success)
    end
  end
end
