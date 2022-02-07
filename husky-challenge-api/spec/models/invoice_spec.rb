RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:issuer) }
    it { is_expected.to validate_presence_of(:payer) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:due_date) }
    it { is_expected.to validate_length_of(:issuer).is_at_most(150) }
    it { is_expected.to validate_length_of(:payer).is_at_most(150) }
    specify do
      subject { create(:invoice) }
      expect validate_uniqueness_of(:number).ignoring_case_sensitivity
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end
end
