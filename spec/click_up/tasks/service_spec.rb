# frozen_string_literal: true

require "faker"

RSpec.describe ClickUp::Tasks::Service do
  include Factories::Task

  let(:list_id) { Faker::Number.number }

  describe "#all" do
    context "with no params" do
      it "sends a request to fetch all unarchived tasks" do
        tasks = build_task_list(2).map(&:to_h)
        response = instance_double(Faraday::Response, body: { "tasks" => tasks }.to_json)
        http_client = instance_double(ClickUp::Client::HttpClient, get: response)
        tasks_service = described_class.new(http_client: http_client, list_id: list_id)

        result = tasks_service.all

        expect(http_client).to have_received(:get).with("list/#{list_id}/task?archived=false")
        expect(result.map(&:to_h)).to eq(tasks)
      end
    end

    context "with archived: true param" do
      it "sends a request to fetch archived tasks" do
        tasks = build_task_list(2).map(&:to_h)
        response = instance_double(Faraday::Response, body: { "tasks" => tasks }.to_json)
        http_client = instance_double(ClickUp::Client::HttpClient, get: response)
        tasks_service = described_class.new(http_client: http_client, list_id: list_id)

        result = tasks_service.all(archived: true)

        expect(http_client).to have_received(:get).with("list/#{list_id}/task?archived=true")
        expect(result.map(&:to_h)).to eq(tasks)
      end
    end
  end

  describe "#find" do
    it "sends a request to fetch the task and returns Task instance" do
      task = {
        "id" => "abc",
        "custom_id" => nil,
        "name" => "do stuff",
        "text_content" => nil,
        "description" => nil,
        "status" => {},
        "orderindex" => "0.91054521075790129000000000000000",
        "date_created" => 1_611_940_117_267,
        "date_updated" => 1_611_940_117_267,
        "date_closed" => nil,
        "archived" => false,
        "creator" => { "id" => 123, "username" => "Foo Bar", "color" => "#27AE60", "email" => "foo@bar.com",
                       "profilePicture" => nil },
        "assignees" => [{ "id" => 1234, "username" => "Foo Baz", "color" => "#27AE60", "initials" => "FB",
                          "email" => "foo@baz.com", "profilePicture" => nil }],
        "watchers" => [],
        "checklists" => [],
        "tags" => [],
        "parent" => nil,
        "priority" => { "id" => "2", "priority" => "high", "color" => "#ffcc00", "orderindex" => "2" },
        "due_date" => 1_610_593_200_000,
        "start_date" => nil,
        "points" => nil,
        "time_estimate" => nil,
        "time_spent" => 0,
        "custom_fields" => [],
        "dependencies" => [],
        "linked_tasks" => [],
        "team_id" => "4593269",
        "url" => "https://app.clickup.com/t/abc",
        "permission_level" => "create",
        "list" => { "id" => "44648182", "name" => "Test List", "access" => true },
        "project" => { "id" => "21512887", "name" => "hidden", "hidden" => true, "access" => true },
        "folder" => { "id" => "21512887", "name" => "hidden", "hidden" => true, "access" => true },
        "space" => { "id" => "6855182" },
        "attachments" => []
      }
      response = instance_double(Faraday::Response, body: task.to_json)
      http_client = instance_double(ClickUp::Client::HttpClient, get: response)
      tasks_service = described_class.new(http_client: http_client, list_id: list_id)

      result = tasks_service.find("abc")

      expect(http_client).to have_received(:get).with("task/abc")
      expect(result).to be_an_instance_of(ClickUp::Tasks::Task)
      expect(result.to_h).to eq(task.transform_keys(&:to_sym))
    end
  end

  describe "#delete" do
    it "sends a request to delete the task" do
      response = instance_double(Faraday::Response, body: "{}")
      http_client = instance_double(ClickUp::Client::HttpClient, delete: response)
      tasks_service = described_class.new(http_client: http_client, list_id: list_id)

      tasks_service.delete("abc")

      expect(http_client).to have_received(:delete).with("task/abc")
    end
  end
end
