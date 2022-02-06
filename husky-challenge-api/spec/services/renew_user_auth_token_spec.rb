RSpec.describe RenewUserAuthToken do
  describe "#call" do
    subject(:call) { described_class.call(user) }

    let(:user) { create(:user) }

    context "when the user is valid" do
      include_examples "success should be true"

      it "updates auth token" do
        expect { call }.to change(user, :auth_token)
      end
    end

    context "when the user is invalid" do
      let(:user) { nil }

      include_examples "success should be false"
      include_examples "return error message with text", "Usuário inválido"
    end
  end
end
