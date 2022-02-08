RSpec.describe "Invoices", type: :request do
  let(:logged_user) { create(:user) }
  let(:headers) { { Authorization: logged_user.auth_token } }
  let(:valid_attributes) { build(:invoice).attributes }
  let(:invalid_attributes) { build(:invoice, issuer: nil).attributes }

  describe "GET /index" do
    it "renders a successful response" do
      Invoice.create! valid_attributes.merge({ user: logged_user })
      get invoices_url, headers: headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      invoice = Invoice.create! valid_attributes.merge({ user: logged_user })
      get invoice_url(invoice), headers: headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new invoice" do
        expect {
          post invoices_url,
               headers: headers,
               params: { invoice: valid_attributes }, as: :json
        }.to change(Invoice, :count).by(1)
      end

      it "renders a JSON response with the new invoice" do
        post invoices_url,
             headers: headers,
             params: { invoice: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new invoice" do
        expect {
          post invoices_url,
               headers: headers,
               params: { invoice: invalid_attributes }, as: :json
        }.not_to change(Invoice, :count)
      end

      it "renders a JSON response with errors for the new invoice" do
        post invoices_url,
             headers: headers,
             params: { invoice: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
