RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(100) }
    it { is_expected.to allow_value("test@test.com").for(:email) }
    it { is_expected.not_to allow_value("test.com").for(:email) }
    it { is_expected.to have_secure_token(:auth_token) }
    specify do
      subject { create(:user) }
      expect validate_uniqueness_of(:email).ignoring_case_sensitivity
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:invoices) }
  end
end
