
module RSpec
  module Alias
    def it desc='', opts={}, &block
      would(desc, opts, &block)
    end

    def self.included mod
      Alias.add(mod,
        %i[it example specify],
        %i[describe context example_group],
        %i[copy shared_examples shared_context],
        %i[paste include_examples include_context it_behaves_like])
    end

    def self.add mod, *names
      mod.module_eval do
        names.each do |(old, *news)|
          news.each do |name|
            alias_method name, old
          end
        end
      end
    end
  end
end
