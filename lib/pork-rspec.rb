
require 'pork/auto'
require 'pork-rspec/config'
require 'pork-rspec/suite'
require 'pork-rspec/context'
require 'pork-rspec/mock'

Pork::Suite.extend RSpec::Suite
Pork::Suite.include RSpec::Context
Pork::Suite.include RSpec::Mock

module RSpec
  include Pork::API
  include Alias
  public *private_instance_methods

  def self.configure
    yield(config)
  end

  def self.config
    @config ||= Config.new
  end
end

include RSpec
