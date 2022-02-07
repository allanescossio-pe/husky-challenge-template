RSpec.describe Login::Execute do
  describe "#call" do
    subject(:call) { described_class.call(auth_token) }

    let(:user) { create(:user, auth_token_has_been_validated: true) }
    let(:auth_token) { user.auth_token }

    context "when authenticate" do
      include_examples "success should be true"

      it "returns user" do
        expect(call.result).to eq(user)
      end
    end

    context "when there are validation errors" do
      include_context "with error result", ["Invalid"]

      before { allow(Login::Validate).to receive(:call).and_return(error_result) }

      include_examples "success should be false"

      it "returns validation errors" do
        expect(call.result).to match_array(["Invalid"])
      end
    end
  end
end
