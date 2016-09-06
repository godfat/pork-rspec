
require 'pork-rspec/expect'

module RSpec
  module Context
    def described_class
      self.class.desc
    end
    alias_method :subject, :described_class

    def is_expected
      expect(subject)
    end

    def expect obj
      Expect.new(pork_stat, obj)
    end

    def eq rhs
      :==.to_proc
    end

    def be_truthy
      ->(obj){ !!obj == true }
    end

    def be_falsey
      ->(obj){ !!obj == false }
    end

    def be_empty
      :empty?.to_proc
    end

    def start_with str
      ->(obj){ obj.start_with?(str) }
    end
  end
end