
require 'pork'
require 'pork-rspec/alias'

module RSpec
  module API
    include Pork::API
    include Alias
  end
end
