RSpec.describe Login, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/login").to route_to("login#create")
    end
  end
end
