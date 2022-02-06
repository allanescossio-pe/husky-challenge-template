RSpec.describe UserAuthToken::Validate do
  describe "#call" do
    subject(:call) { described_class.call(user) }

    let(:user) { create(:user) }

    include_examples "success should be true"

    it "sets auth_token_has_been_validated to true" do
      expect { call }.to change(user, :auth_token_has_been_validated).to(true)
    end
  end
end
