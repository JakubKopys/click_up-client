# frozen_string_literal: true

require "faker"

module Support
  module Tasks
    STATUSES = %w[pending in_progress done].freeze

    def default_task_attributes
      {
        id: Faker::Alphanumeric.alpha,
        custom_id: nil,
        name: Faker::Alphanumeric.alpha,
        text_content: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        status: build_status,
        orderindex: Faker::Number.decimal.to_s,
        date_created: date_created,
        date_updated: nil,
        start_date: nil,
        date_closed: nil,
        due_date: nil,
        archived: false,
        creator: build_creator,
        assignees: [],
        watchers: [],
        tags: [],
        parent: nil,
        priority: nil,
        points: Faker::Number.between(from: 1, to: 10),
        time_estimate: nil,
        time_spent: nil,
        custom_fields: [],
        dependencies: [],
        linked_tasks: [],
        team_id: Faker::Number.number.to_s,
        url: Faker::Internet.url(host: "clickup.com"),
        permission_level: "create",
        list: build_list,
        project: build_project,
        folder: build_folder,
        space: build_space,
        attachments: [],
        checklists: []
      }
    end

    private

    def date_created
      Faker::Time.between(from: DateTime.now - 10, to: DateTime.now).to_time.to_i
    end

    def build_status(status: STATUSES.sample)
      {
        "status" => status,
        "color" => Faker::Color.hex_color,
        "type" => "custom",
        "orderindex" => 2
      }
    end

    def build_creator
      {
        "id" => Faker::Number.number,
        "username" => Faker::Name.name,
        "color" => Faker::Color.hex_color,
        "email" => Faker::Internet.email,
        "profilePicture" => nil
      }
    end

    def build_list
      {
        "id" => Faker::Number.number,
        "name" => Faker::Lorem.word,
        "access" => true
      }
    end

    def build_project
      {
        "id" => Faker::Number.number.to_s,
        "name" => "hidden",
        "hidden" => true,
        "access" => true
      }
    end

    def build_folder
      {
        "id" => Faker::Number.number.to_s,
        "name" => "hidden",
        "hidden" => true,
        "access" => true
      }
    end

    def build_space
      { "id" => Faker::Number.number.to_s }
    end
  end
end
