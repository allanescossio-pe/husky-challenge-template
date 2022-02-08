shared_context "authorization header" do
  let(:default_headers) { { Authorization: create(:user).auth_token } }
end
