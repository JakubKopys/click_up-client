# frozen_string_literal: true

require "faker"

require "support/tasks"

module Factories
  module Task
    include Support::Tasks

    def build_task_list(number_of_tasks)
      tasks = []
      number_of_tasks.times do
        tasks << build_task
      end
      tasks
    end

    # @param custom_attributes [Hash] attributes of Task
    def build_task(custom_attributes = {})
      default_attributes = default_task_attributes
      attributes = default_attributes.merge(custom_attributes)

      ClickUp::Tasks::Task.new(attributes)
    end
  end
end
