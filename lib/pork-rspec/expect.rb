
require 'pork/expect'

module RSpec
  class Expect < Struct.new(:pork_stat, :object)
    def to verifier
      Pork::Expect.new(pork_stat, object).satisfy(&verifier)
    end

    def not_to verifier
      Pork::Expect.new(pork_stat, object).not.satisfy(&verifier)
    end
    alias_method :to_not, :not_to
  end
end
