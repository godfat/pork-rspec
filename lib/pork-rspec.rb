
require 'pork/auto'
require 'pork-rspec/config'
require 'pork-rspec/imp'
require 'pork-rspec/context'
require 'pork-rspec/config'

Pork::Suite.extend RSpec::Imp
Pork::Suite.include RSpec::Context

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
