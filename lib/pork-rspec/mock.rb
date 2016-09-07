
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
          method_missing(receive.message, &receive.blocks.last)

        receive.blocks[0..-2].each do |block|
          Muack::API.coat(object).method_missing(receive.message, &block)
        end
      end
    end

    class Receive < Struct.new(:message, :blocks)
      def and_return *values
        self.blocks = values.map{ |v| lambda{ v } }
        self
      end
    end

    def double name='unnamed', defs={}
      defs = name if name.kind_of?(Hash)
      allow(Object.new).to receive_messages(defs)
    end

    def allow obj
      Allow.new(obj)
    end

    def receive msg, &block
      Receive.new(msg, [block])
    end

    def receive_messages defs
      defs.map do |msg, value|
        receive(msg).and_return(value)
      end
    end
  end
end
