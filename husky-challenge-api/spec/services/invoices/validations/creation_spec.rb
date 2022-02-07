RSpec.describe Invoices::Validations::Creation do
  describe "#call" do
    subject(:call) { described_class.call(invoice) }

    context "when the invoice is valid" do
      let(:invoice) { build(:invoice) }

      include_examples "success should be true"
    end

    context "when the invoice not found" do
      let(:invoice) { nil }

      include_examples "success should be false"

      it "returns invoice not found message" do
        expect(call.result).to match_array(["Fatura não encontrada"])
      end
    end

    context "when the invoice is invalid" do
      let(:invoice) { build(:invoice, user: nil) }

      include_examples "success should be false"

      it "returns invoice validation messages" do
        expect(call.result).to match_array(["Usuário é obrigatório(a)"])
      end
    end

    context "when the due date is in the past" do
      let(:invoice) { build(:invoice, due_date: 1.day.ago) }

      include_examples "success should be false"

      it "returns due date is behind messages" do
        expect(call.result).to match_array(["Data para vencimento já passou"])
      end
    end
  end
end
