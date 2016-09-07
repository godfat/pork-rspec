
require 'pork/expect'
require 'pork-rspec/mock'

module RSpec
  class Expect < Struct.new(:pork_stat, :object)
    def to verifier, negate=false
      case verifier
      when Array, Mock::Receive
        mock(verifier)
      else
        expect = Pork::Expect.new(pork_stat, object)
        expect.not if negate
        verifier.call(expect)
      end
    end

    def not_to verifier
      to(verifier, true)
    end
    alias_method :to_not, :not_to

    private
    def mock receive
      case receive
      when Array
        receive.each(&method(:stub))
      else
        stub(receive)
      end

      object
    end

    def stub receive
      receive.blocks.each do |block|
        Muack::API.mock(object).method_missing(receive.message, &block)
      end
    end
  end
end
