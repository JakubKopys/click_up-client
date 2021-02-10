# frozen_string_literal: true

require "forwardable"

require_relative "./task"

module ClickUp
  module Tasks
    class Collection
      extend Forwardable
      def_delegators :@tasks, :size, :each, :last
      include Enumerable

      # @param tasks [Array<ClickUp::Tasks::Task>]
      def initialize(tasks)
        @tasks = tasks
      end

      alias all to_a
    end
  end
end
