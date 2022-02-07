RSpec.describe Login::Validate do
  describe "#call" do
    subject(:call) { described_class.call(user) }

    let(:user) { create(:user, auth_token_has_been_validated: true) }

    context "when the user is valid" do
      include_examples "success should be true"
    end

    context "when the user not found" do
      let(:user) { nil }

      include_examples "success should be false"

      it "returns not found user message" do
        expect(call.result).to match_array(["Usuário não encontrado"])
      end
    end

    context "when the auth token isn't validated" do
      let(:user) { create(:user, auth_token_has_been_validated: false) }

      include_examples "success should be false"

      it "returns need validate auth token message" do
        expect(call.result).to match_array(["É necessário validar o token de acesso. Por favor, cheque sua caixa de email ou gere um novo token."])
      end
    end
  end
end
