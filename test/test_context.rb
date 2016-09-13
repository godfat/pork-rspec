
require 'pork-rspec/test'

describe M do
  it { is_expected.to eq(M) }
  it { expect(subject).to eq(M) }
end

describe C do
  it { is_expected.to be_a(C) }
  it { expect(subject).to be_a(C) }
end
