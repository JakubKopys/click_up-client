# frozen_string_literal: true

require_relative "./task"

module ClickUp
  module Tasks
    module Factory
      module_function

      # @param items [Array] An array of objects containing Task fields
      def build_collection(items)
        items.map { |task| Task.new(task) }
      end
    end
  end
end
