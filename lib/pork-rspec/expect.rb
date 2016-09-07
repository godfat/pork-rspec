
require 'pork/expect'

module RSpec
  class Expect < Struct.new(:pork_stat, :object)
    def to verifier
      verifier.call(Pork::Expect.new(pork_stat, object))
    end

    def not_to verifier
      verifier.call(Pork::Expect.new(pork_stat, object).not)
    end
    alias_method :to_not, :not_to
  end
end
