# frozen_string_literal: true

module ClickUp
  module Tags
    class Service
      # @param space_id [Integer]
      # @param http_client [#get, #delete, #post, #put, #patch] any object implementing http requests
      def initialize(space_id:, http_client:)
        @space_id = space_id
        @http_client = http_client
      end

      # TODO: docs
      def all
        url = "space/#{@space_id}/tag"

        resp = @http_client.get(url)

        body = Oj.load(resp.body)
        tags = body.fetch("tags")
        ClickUp::Tags::Factory.build_collection(tags)
      end
    end
  end
end
