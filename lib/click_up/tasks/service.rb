# frozen_string_literal: true

require "oj"

module ClickUp
  module Tasks
    class Service
      attr_reader :list_id

      def initialize(http_client:, list_id:)
        @http_client = http_client
        @list_id = list_id
      end

      def all(archived: false)
        url = "list/#{@list_id}/task?archived=#{archived}"

        resp = @http_client.get(url)

        body = Oj.load(resp.body)

        # TODO: return task instances
        # TODO: return Task Collection
        body.fetch("tasks")
      end

      def find(task_id)
        resp = @http_client.get("task/#{task_id}")
        Oj.load(resp.body).then { |task| Task.new(task) }
      end

      def delete(task_id)
        @http_client.delete("task/#{task_id}")
      end
    end
  end
end
