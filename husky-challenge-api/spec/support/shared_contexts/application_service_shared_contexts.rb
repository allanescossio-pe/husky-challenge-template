shared_context "with success result" do
  let(:success_result) { OpenStruct.new(success?: true) }
  let(:error_result) { OpenStruct.new(success?: false) }
end
