RSpec.describe UserAuthToken::Renew do
  describe "#call" do
    subject(:call) { described_class.call(user) }

    let(:user) { create(:user, auth_token_has_been_validated: true) }

    context "when the user is valid" do
      include_context "with success result"

      include_examples "success should be true"

      it "updates auth token" do
        expect { call }.to change(user, :auth_token)
      end

      it "sets auth_token_has_been_validated to false" do
        expect { call }.to change(user, :auth_token_has_been_validated).to(false)
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

      it "stop process with raise error" do
        expect { call }.to raise_error(StandardError)
      end
    end
  end
end
