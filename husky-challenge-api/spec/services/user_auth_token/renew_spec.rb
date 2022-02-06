RSpec.describe UserAuthToken::Renew do
  describe "#call" do
    subject(:call) { described_class.call(user) }

    let(:user) { create(:user) }

    context "when the user is valid" do
      include_context "with success result"

      before { allow(UserAuthToken::SendMail).to receive(:call).with(user).and_return(success_result) }

      include_examples "success should be true"

      it "updates auth token" do
        expect { call }.to change(user, :auth_token)
      end

      it "sends mail" do
        expect(UserAuthToken::SendMail).to receive(:call).with(user)
        call
      end
    end

    context "when the user is invalid" do
      let(:user) { nil }

      include_examples "success should be false"
      include_examples "return error message with text", "Usuário inválido"
    end

    context "when there are errors" do
      before { allow(UserAuthToken::SendMail).to receive(:call).with(user).and_raise(StandardError) }

      include_examples "success should be false"

      it "doesn't change auth token" do
        initial_auth_token = user.auth_token
        call
        expect(User.find(user.id).auth_token).to eq(initial_auth_token)
      end

      it "returns error message" do
        expect(call.result).to eq("Ocorreu um erro ao atualizar o token")
      end
    end
  end
end
