# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "click_up/client"
require "dotenv/load"
require "webmock/rspec"
require "pry"
require "factories/task"

RSpec.configure do |config|
  config.include Factories::Task

  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
