require 'rails_helper'

RSpec.describe "ConservationGroups", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/conservation_groups/show"
      expect(response).to have_http_status(:success)
    end
  end

end
