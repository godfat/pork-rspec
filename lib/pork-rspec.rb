
require 'pork/auto'
require 'pork-rspec/config'
require 'pork-rspec/suite'
require 'pork-rspec/context'
require 'pork-rspec/mock'

Pork::Suite.extend RSpec::Suite
Pork::Suite.include RSpec::Context
Pork::Suite.include RSpec::Mock
Pork::Suite.after do
  Muack.verify
end

module RSpec
  include Pork::API
  public *private_instance_methods
  include Alias

  def self.configure
    yield(config)
  end

  def self.config
    @config ||= Config.new
  end
end

include RSpec
