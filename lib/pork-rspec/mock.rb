
require 'muack'

module RSpec
  module Mock
    class Allow < Struct.new(:object)
      def to receive
        case receive
        when Array
          receive.each(&method(:stub))
        else
          stub(receive)
        end

        object
      end

      private
      def stub receive
        Muack::API.stub(object).
          method_missing(receive.message, &receive.block)
      end
    end

    class Receive < Struct.new(:message, :block)
      def and_return value
        self.block = lambda{ value }
        self
      end
    end

    def double name='unnamed', defs={}
      allow(Muack::API.stub.object).to receive_messages(defs)
    end

    def allow obj
      Allow.new(obj)
    end

    def receive msg, &block
      Receive.new(msg, block)
    end

    def receive_messages defs
      defs.map do |msg, value|
        receive(msg).and_return(value)
      end
    end
  end
end
