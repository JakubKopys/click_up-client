# frozen_string_literal: true

require "faraday"
require "forwardable"

module ClickUp
  class Client
    class HttpClient
      extend Forwardable

      CLICK_UP_API_BASE_URL = "https://api.clickup.com/api/v2"

      def initialize(api_token:)
        @client = init_client(api_token)
      end

      def_delegators :@client, :get, :post, :put, :delete

      private

      def init_client(api_token)
        Faraday.new(
          url: CLICK_UP_API_BASE_URL,
          headers: {
            "Authorization" => api_token,
            "Accept" => "application/json"
          }
        ) do |conn|
          conn.response :logger if ENV["FARADAY_ENABLE_LOGGER"]
          conn.response :raise_error
        end
      end
    end
  end
end
