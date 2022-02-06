RSpec.describe UserAuthToken::SendMail do
  describe "#call" do
    subject(:call) { described_class.call(user) }

    let(:user) { create(:user) }

    context "when sent mail" do
      include_examples "success should be true"

      it "deliveries user generated token mail" do
        expect { call }.to have_enqueued_job(ActionMailer::MailDeliveryJob)
                             .with("UserTokenMailer", "generated", "deliver_now", { args: [user] })
      end
    end
  end
end
