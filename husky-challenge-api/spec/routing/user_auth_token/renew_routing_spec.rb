RSpec.describe UserAuthToken::RenewController, type: :routing do
  describe "routing" do
    it "routes to #update" do
      expect(patch: "/user_auth_token/renew/test@test%2ecom").to route_to("user_auth_token/renew#update",
                                                                    email: "test@test.com")
    end
  end
end
