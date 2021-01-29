# frozen_string_literal: true

require_relative "client/version"
require_relative "client/test"

module ClickUp
  class Client
    attr_reader :api_token

    def initialize(options = {})
      @api_token = options.fetch(:api_token)
    end
  end
end
