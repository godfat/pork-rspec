
require 'pork/expect'

module RSpec
  class Expect < Struct.new(:pork_stat, :object)
    def to verifier, negate=false
      expect = Pork::Expect.new(pork_stat, object)
      expect.not if negate
      verifier.call(expect)
    end

    def not_to verifier
      to(verifier, true)
    end
    alias_method :to_not, :not_to
  end
end
