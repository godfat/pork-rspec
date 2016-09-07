
require 'pork-rspec/test'

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
