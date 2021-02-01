# frozen_string_literal: true

require "dry-struct"
require_relative "../types/base"

module ClickUp
  module Tasks
    class Task < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Base::String
      attribute :custom_id, Types::Base::String.optional
      attribute :name, Types::Base::String
      attribute :text_content, Types::Base::String.optional
      attribute :description, Types::Base::String.optional
      attribute :status, Types::Base::Hash
      attribute :orderindex, Types::Base::Strict::String
      # TODO-BEGIN: Handle unix timestamp
      attribute :date_created, Types::Base::String
      attribute :date_updated, Types::Base::String.optional
      attribute :start_date, Types::Base::String.optional
      attribute :date_closed, Types::Base::String.optional
      attribute :due_date, Types::Base::String.optional
      # TODO-END: Handle unix timestamp
      attribute :archived, Types::Base::Bool
      attribute :creator, Types::Base::Hash
      attribute :assignees, Types::Base::Array
      attribute :watchers, Types::Base::Array
      attribute :tags, Types::Base::Array
      # TODO: define specific type
      attribute :parent, Types::Base::Any
      attribute :priority, Types::Base::Hash
      # TODO: define specific type
      attribute :points, Types::Base::Any
      # TODO: define specific type
      attribute :time_estimate, Types::Base::Any
      attribute :time_spent, Types::Base::Integer
      attribute :custom_fields, Types::Base::Array
      attribute :dependencies, Types::Base::Array
      attribute :linked_tasks, Types::Base::Array
      attribute :team_id, Types::Base::String
      attribute :url, Types::Base::String
      attribute :permission_level, Types::Base::String
      attribute :list, Types::Base::Hash
      attribute :project, Types::Base::Hash
      attribute :folder, Types::Base::Hash
      attribute :space, Types::Base::Hash
      attribute :attachments, Types::Base::Array
      attribute :checklists, Types::Base::Array
    end
  end
end
