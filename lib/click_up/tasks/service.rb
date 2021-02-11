# frozen_string_literal: true

require "oj"

module ClickUp
  module Tasks
    class Service
      attr_reader :list_id

      # @param list_id [Integer]
      # @param http_client [#get, #delete, #post, #put, #patch] any object implementing http requests
      def initialize(list_id:, http_client:)
        @list_id = list_id
        @http_client = http_client
      end

      # @param archived [Boolean] flag telling whether to fetch only achieved tasks or unarchived ones
      # @return [Array<ClickUp::Tasks::Task>]
      def all(archived: false)
        url = "list/#{@list_id}/task?archived=#{archived}"

        resp = @http_client.get(url)

        body = Oj.load(resp.body)
        tasks = body.fetch("tasks")
        ClickUp::Tasks::Factory.build_collection(tasks)
      end

      # @param task_id [String]
      # @return [ClickUp::Tasks::Task]
      def find(task_id)
        resp = @http_client.get("task/#{task_id}")

        Oj.load(resp.body).then { |task| Task.new(task) }
      end

      # @param task_id [String]
      def delete(task_id)
        @http_client.delete("task/#{task_id}")
      end

      # @param attributes [Hash]
      # @return [ClickUp::Tasks::Task]
      def create(attributes)
        url = "list/#{@list_id}/task"

        payload = Oj.dump(attributes, mode: :compat)
        resp = @http_client.post(url, payload, { "Content-Type" => "application/json" })

        Oj.load(resp.body).then { |task| Task.new(task) }
      end
    end
  end
end
