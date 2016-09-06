
module RSpec
  module Alias
    def it desc='', opts={}, &block
      would(desc, opts, &block)
    end

    def self.included mod
      mod.module_eval do
        alias_method :context, :describe
      end
    end
  end
end
