RSpec.describe "UserAuthToken::Validate", type: :request do
  describe "PATCH /user_auth_token/validate/:id" do
    include_context "with success result"

    let(:user) { create(:user) }

    context "with valid user" do
      before { allow(UserAuthToken::Validate).to receive(:call).with(user).and_return(success_result) }

      it "validates token", :aggregate_failures do
        expect(UserAuthToken::Validate).to receive(:call).with(user)

        patch user_auth_token_validate_path(user)

        expect(response).to have_http_status(:ok)
      end
    end

    context "with non existent user" do
      it "returns a invalid user message", :aggregate_failures do
        patch "/user_auth_token/validate/-1"

        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq("{\"error\":\"Usuário não encontrado\"}")
      end
    end

    context "when does not renew token" do
      before { allow(UserAuthToken::Validate).to receive(:call).with(user).and_return(error_result) }

      it "returns unprocessable_entity status" do
        patch user_auth_token_validate_path(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
