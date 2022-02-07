RSpec.describe "Logins", type: :request do
  describe "POST /login" do
    context "with valid auth token" do
      let!(:user) { create(:user, auth_token_has_been_validated: true, auth_token: auth_token) }
      let(:auth_token) { "QWERTY" }

      it "successfully log in" do
        post login_index_url, params: { auth: { token: auth_token } }, as: :json
        expect(response).to have_http_status(:ok)
      end

      it "returns a user payload" do
        post login_index_url, params: { auth: { token: auth_token } }, as: :json

        expect(response.body).to match(a_string_including(user.to_json))
      end
    end

    context "with invalid token" do
      it "does not log in" do
        post login_index_url, params: { auth: { token: "" } }, as: :json

        expect(response).to have_http_status(:unauthorized)
      end

      it "renders a JSON response with errors for the login" do
        post login_index_url, params: { auth: { token: "" } }, as: :json

        expect(response.body).to match(a_string_including("Usuário não encontrado"))
      end
    end
  end
end
