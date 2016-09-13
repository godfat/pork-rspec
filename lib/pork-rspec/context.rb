
require 'pork-rspec/expect'

module RSpec
  module Context
    def described_class klass=self.class, desc=klass.desc
      case current = klass.desc
      when Module
        current
      else
        if parent = klass.instance_variable_get(:@super_executor)
          described_class(parent, desc)
        else
          desc
        end
      end
    end

    def subject
      @subject ||= case klass = described_class
                   when Class
                     klass.new
                   else
                     klass
                   end
    end

    def is_expected
      expect(subject)
    end

    def expect obj=self, &block
      Expect.new(pork_stat, block || obj)
    end

    def eq rhs
      ->(actual){ actual == rhs }
    end

    def eql rhs
      ->(actual){ actual.eql?(rhs) }
    end

    def equal rhs
      ->(actual){ actual.equal?(rhs) }
    end
    alias_method :be, :equal

    def be_an_instance_of rhs
      ->(actual){ actual.class == rhs }
    end

    def be_a rhs
      ->(actual){ actual.kind_of?(rhs) }
    end
    alias_method :be_an, :be_a
    alias_method :be_a_kind_of, :be_a

    def be_truthy
      ->(actual){ actual != nil && actual != false }
    end

    def be_falsey
      :!.to_proc
    end

    def be_empty
      :empty?.to_proc
    end

    def be_nil
      eq(nil)
    end

    def raise_error error, msg=nil
      ->(actual) do
        exc = actual.raise(error)
        expect(exc.message).to eq(msg) if msg
      end
    end

    def contain_exactly *elements
      eq(elements)
    end

    def match rhs
      ->(actual){ actual =~ rhs }
    end

    def start_with str
      ->(actual){ actual.start_with?(str) }
    end
  end
end
