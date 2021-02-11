# frozen_string_literal: true

require "faker"

module Factories
  module Task
    STATUSES = %w[pending in_progress done].freeze

    def build_task_list(number_of_tasks)
      tasks = []
      number_of_tasks.times do
        tasks << build_task
      end
      tasks
    end

    # rubocop:disable Metrics/ParameterLists
    def build_task(
      id: Faker::Alphanumeric.alpha,
      custom_id: nil,
      name: Faker::Alphanumeric.alpha,
      text_content: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      status: build_status,
      orderindex: Faker::Number.decimal.to_s,
      date_created: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now).to_time.to_i,
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
    )
      # rubocop:enable Metrics/ParameterLists
      ClickUp::Tasks::Task.new(
        id: id,
        custom_id: custom_id,
        name: name,
        text_content: text_content,
        description: description,
        status: status,
        orderindex: orderindex,
        date_created: date_created,
        date_updated: date_updated,
        start_date: start_date,
        date_closed: date_closed,
        due_date: due_date,
        archived: archived,
        creator: creator,
        assignees: assignees,
        watchers: watchers,
        tags: tags,
        parent: parent,
        priority: priority,
        points: points,
        time_estimate: time_estimate,
        time_spent: time_spent,
        custom_fields: custom_fields,
        dependencies: dependencies,
        linked_tasks: linked_tasks,
        team_id: team_id,
        url: url,
        permission_level: permission_level,
        list: list,
        project: project,
        folder: folder,
        space: space,
        attachments: attachments,
        checklists: checklists
      )
    end

    private

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
