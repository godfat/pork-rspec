
require 'pork/auto'
require 'pork-rspec'

module M
  def m
    'm'
  end

  module N
    def n
      'n'
    end
  end
end

class C
  def self.c
    'C'
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures  = false
  config.mock_with :rspec

  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.include M, type: :controller
  config.include M::N

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.before(:suite) do
    #
  end

  config.around(:each, :caching) do |example|
    #
  end
end

describe C, models: true do
  let(:a) { 'a' }

  it { is_expected.to be_truthy }
  it { expect(subject).to be_truthy }
  it { expect(a).to eq('a') }

  describe '#c' do
    before do
      @b = [subject.c]
    end

    it('message') { expect(@b).not_to be_empty }
    it { expect(@b).to contain_exactly('C') }
  end
end

describe 'sum' do
  let(:result) { sum(data) }

  shared_examples 'sum numbers' do
    it do
      expect(result).to eq(duration)
    end
  end

  context 'test sample A' do
    let(:data) do
      0..9
    end

    let(:duration) { 45 }

    it_behaves_like 'sum numbers'
  end

  def sum(data)
    data.inject(0, &:+)
  end
end

describe 'let!' do
  let(:data) { [] }
  let!(:a) { data << 0 }
  before { data << 1 }
  it { expect(a).to contain_exactly(0, 1) }
end

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
