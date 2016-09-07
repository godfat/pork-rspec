
module RSpec
  module Alias
    def it desc='', opts={}, &block
      would(desc, opts, &block)
    end

    def self.included mod
      mod.module_eval do
        alias_method :context, :describe

        alias_method :shared_examples, :copy
        alias_method :shared_context, :copy

        alias_method :include_examples, :paste
        alias_method :include_context, :paste
        alias_method :it_behaves_like, :paste
      end
    end
  end
end
