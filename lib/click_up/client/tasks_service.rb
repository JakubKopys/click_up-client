# frozen_string_literal: true

require "oj"

module ClickUp
  class Client
    class TasksService
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
        body.fetch("tasks")
      end

      def find(task_id)
        resp = @http_client.get("task/#{task_id}")

        # TODO: return task instance
        Oj.load(resp.body)
      end

      def delete(task_id)
        @http_client.delete("task/#{task_id}")
      end
    end
  end
end
