RSpec.describe CreateUser do
  describe "#call" do
    subject(:call) { described_class.call(user_params) }

    let(:user_params) do
      {
        name: FFaker::NameBR.name,
        email: FFaker::Internet.email
      }
    end

    context "when the params are valid" do
      include_examples "success should be true"

      it "sends mail" do
        expect(UserAuthToken::SendMail).to receive(:call).with(an_instance_of(User))
        call
      end
    end

    context "when the params are invalid" do
      before { user_params.merge!({ name: "" }) }

      include_examples "success should be false"

      it "returns user errors" do
        create_user = call

        expect(create_user.result.class).to eq(ActiveModel::Errors)
      end

      context "when there are errors" do
        before { allow(UserAuthToken::SendMail).to receive(:call).with(User.last).and_raise(StandardError) }

        include_examples "success should be false"

        it "doesn't create user" do
          call
          expect(User.count).to be_zero
        end
      end
    end
  end
end
