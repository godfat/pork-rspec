
require 'pork'
require 'pork-rspec/alias'

module RSpec
  module Imp
    include Pork::Imp
    include Alias

    def let name, &block
      define_method(name) do
        ivar = "@#{name}"
        instance_variable_get(ivar) ||
          instance_variable_set(ivar, block.call)
      end
    end
    alias_method :given, :let

    def subject &block
      let(:subject, &block)
    end
  end
end
