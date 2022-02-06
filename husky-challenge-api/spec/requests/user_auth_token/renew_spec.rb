RSpec.describe "UserAuthToken::Renew", type: :request do
  describe "PATCH /user_auth_token/renew/:email" do
    include_context "with success result"

    let(:valid_url) { "/user_auth_token/renew/test@email%2ecom"}
    let(:user) { create(:user, email: "test@email.com") }

    context "with valid user" do
      before { allow(UserAuthToken::Renew).to receive(:call).with(user).and_return(success_result) }

      it "renews token", :aggregate_failures do
        expect(UserAuthToken::Renew).to receive(:call).with(user)

        patch valid_url

        expect(response).to have_http_status(:ok)
      end
    end

    context "with non existent user" do
      it "returns a invalid user message", :aggregate_failures do
        patch "/user_auth_token/renew/test@email"

        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq("{\"error\":\"Usuário não encontrado\"}")
      end
    end

    context "when does not renew token" do
      before { allow(UserAuthToken::Renew).to receive(:call).with(user).and_return(error_result) }

      it "returns unprocessable_entity status" do
        patch valid_url

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
