shared_context "with success result" do
  let(:success_result) { OpenStruct.new(success?: true) }
end

shared_context "with error result" do |result|
  let(:error_result) { OpenStruct.new(success?: false, result: result) }
end
