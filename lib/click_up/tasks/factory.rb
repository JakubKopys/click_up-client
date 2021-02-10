# frozen_string_literal: true

require_relative "./task"
require_relative "./collection"

module ClickUp
  module Tasks
    module Factory
      module_function

      # @param items [Array] An array of objects containing Task fields
      def build_collection(items)
        tasks = items.map { |task| Task.new(task) }
        ClickUp::Tasks::Collection.new(tasks)
      end
    end
  end
end
