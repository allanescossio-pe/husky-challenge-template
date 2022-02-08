RSpec.describe InvoicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/invoices").to route_to("invoices#index")
    end

    it "routes to #show" do
      expect(get: "/invoices/1").to route_to("invoices#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/invoices").to route_to("invoices#create")
    end
  end
end
