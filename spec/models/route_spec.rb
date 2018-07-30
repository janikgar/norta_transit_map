require 'rails_helper'

describe "helper.get_routes" do
  before do
    # Get only the first route from Transit.land
    @request = ENV['TL_ROUTES']+ENV['NORTA_ONESTOP']+"&per_page=1"
    @first_route = HTTParty.get(@request).parsed_response['routes'].first
    @first_route["id"] = nil
    @first_route["created_at"] = DateTime.parse(@first_route["created_at"])
    @first_route["updated_at"] = DateTime.parse(@first_route["updated_at"])
    @first_route_in_model = Route.new(@first_route)
  end

  describe "routes" do
    it "gets fresh routes from Transit.land" do
      expect(@first_route).to be_a(Hash)
    end

    it "lists the test Route" do
      expect(@first_route).to eq(@first_route_in_model.as_json)
    end
  end
end