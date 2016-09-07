
require 'pork'
require 'pork-rspec/imp'
require 'pork-rspec/context'
require 'pork-rspec/config'

Pork::Executor.extend RSpec::Imp
Pork::Executor.include RSpec::Context

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
