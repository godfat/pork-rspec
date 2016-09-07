
require 'pork-rspec/test'

RSpec.shared_examples "collections" do |collection_class|
  it "is empty when first created" do
    expect(collection_class.new).to be_empty
  end
end

RSpec.describe Array do
  include_examples "collections", Array
end

RSpec.describe Hash do
  include_examples "collections", Hash
end

RSpec.describe C do
  example do
    expect(described_class).to equal(C)
  end
end
