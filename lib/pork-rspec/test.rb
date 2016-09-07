
require 'pork-rspec'

module M
  def m
    'm'
  end

  module N
    def n
      'n'
    end
  end
end

class C
  def self.c
    'C'
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures  = false
  config.mock_with :rspec

  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.include M, type: :controller
  config.include M::N

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.before(:suite) do
    #
  end

  config.around(:each, :caching) do |example|
    #
  end
end
