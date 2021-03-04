# frozen_string_literal: true

require_relative "./tag"

module ClickUp
  module Tags
    module Factory
      module_function

      # @param items [Array] An array of objects containing Task fields
      # @return [Array<ClickUp::Tags::Tag>]
      def build_collection(items)
        items
          .map { |tag_hash| tag_hash.transform_keys(&:to_sym) }
          .map { |tag_hash| Tag.new(tag_hash) }
      end
    end
  end
end
