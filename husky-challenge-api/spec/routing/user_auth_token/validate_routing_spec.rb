RSpec.describe UserAuthToken::ValidateController, type: :routing do
  describe "routing" do
    it "routes to #update" do
      expect(get: "/user_auth_token/validate/1").to route_to("user_auth_token/validate#update", id: "1")
    end
  end
end
