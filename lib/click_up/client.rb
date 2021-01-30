# frozen_string_literal: true

require_relative "client/version"
require_relative "client/http_client"
require_relative "client/tasks_service"

module ClickUp
  class Client
    attr_reader :api_token, :default_list_id

    def initialize(options = {})
      @api_token = options.fetch(:api_token)
      @default_list_id = options.fetch(:default_list_id, nil)

      @http_client = HttpClient.new(api_token: @api_token)
    end

    def tasks(list_id: @default_list_id)
      raise ArgumentError, "list_id can't be nil when default_list_id was not provided" if list_id.nil?

      ClickUp::Client::TasksService.new(list_id: list_id, http_client: @http_client)
    end
  end
end
