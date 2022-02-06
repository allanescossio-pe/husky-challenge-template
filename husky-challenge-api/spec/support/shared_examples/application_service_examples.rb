shared_examples "success should be true" do
  it "success is expected to be true" do
    expect(call.success?).to be true
  end
end

shared_examples "success should be false" do
  it "success is expected to be false" do
    expect(call.success?).to be false
  end
end

shared_examples "return error message with text" do |message|
  it "returns error message with text: #{message}" do
    expect(call.result).to eq(message)
  end
end
