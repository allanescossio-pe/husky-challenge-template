RSpec.describe Invoices::Create do
  describe "#call" do
    subject(:call) { described_class.call(invoice_params, user) }

    let(:user) { create(:user) }
    let(:invoice_params) { build(:invoice).attributes }

    context "when the params are valid" do
      include_examples "success should be true"

      it "returns new invoice" do
        create_invoice = call

        expect(create_invoice.result.class).to eq(Invoice)
      end
    end

    context "when the params are invalid" do
      before { invoice_params.merge!({ issuer: nil }) }

      include_examples "success should be false"

      it "returns user errors" do
        create_invoice = call

        expect(create_invoice.result.class).to eq(ActiveModel::Errors)
      end
    end

    context "when there are errors" do
      before { allow(Invoices::Validations::Creation).to receive(:call).and_raise(StandardError) }

      it "stop process with raise error" do
        expect { call }.to raise_error(StandardError)
      end
    end
  end
end
