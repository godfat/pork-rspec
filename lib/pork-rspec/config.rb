
module RSpec
  class Config < Struct.new(:modules)
    def initialize
      super([])
    end

    def include mod, *args
      modules << mod
      warn("Ignored include arguments: #{args}") if args.any?
    end

    def before *types
    end

    def after *types
    end

    def around *types, &block
      before(*types, &block)
      after(*types, &block)
    end

    def method_missing msg, *args
      warn("Unrecognized configuration: #{msg}(*#{args})")
    end
  end
end
