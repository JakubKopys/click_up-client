# frozen_string_literal: true

require "faraday"

module ClickUp
  class Client
    module HttpClient
      CLICK_UP_API_BASE_URL = "https://api.clickup.com/api/v2"

      module_function

      def new(api_token:)
        Faraday.new(
          url: CLICK_UP_API_BASE_URL,
          headers: {
            'Authorization' => api_token,
            'Accept' => 'application/json',
          }
        ) do |conn|
          conn.response :logger if ENV["FARADAY_ENABLE_LOGGER"]
          conn.response :raise_error
        end
      end
    end
  end
end
