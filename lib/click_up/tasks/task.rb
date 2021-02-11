# frozen_string_literal: true

require "dry-struct"
require_relative "../types/base"

module ClickUp
  module Tasks
    class Task < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Base::String
      attribute? :custom_id, Types::Base::String.optional
      attribute :name, Types::Base::String
      attribute :text_content, Types::Base::String.optional
      attribute :description, Types::Base::String.optional
      attribute :status, Types::Base::Hash
      attribute :orderindex, Types::Base::Strict::String
      attribute :date_created, Types::Base::Coercible::Integer
      attribute :date_updated, Types::Base::Coercible::Integer.optional
      attribute :start_date, Types::Base::Coercible::Integer.optional
      attribute :date_closed, Types::Base::Coercible::Integer.optional
      attribute :due_date, Types::Base::Coercible::Integer.optional
      attribute :archived, Types::Base::Bool
      attribute :creator, Types::Base::Hash
      attribute :assignees, Types::Base::Array
      attribute :watchers, Types::Base::Array
      attribute :tags, Types::Base::Array
      attribute :parent, Types::Base::Any
      attribute :priority, Types::Base::Hash.optional
      attribute :points, Types::Base::Integer.optional
      attribute :time_estimate, Types::Base::Integer.optional
      attribute? :time_spent, Types::Base::Integer.optional
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
      attribute? :attachments, Types::Base::Array
      attribute :checklists, Types::Base::Array
    end
  end
end
