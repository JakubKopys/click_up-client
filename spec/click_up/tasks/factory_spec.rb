# frozen_string_literal: true

require "support/tasks"

RSpec.describe ClickUp::Tasks::Factory do
  include Support::Tasks

  describe "#build_collection" do
    it "returns array of Task instances" do
      tasks = [
        default_task_attributes.merge(id: "test1"),
        default_task_attributes.merge(id: "test2")
      ]

      result = described_class.build_collection(tasks)

      expect(result.size).to eq 2
      expect(result.first).to be_an_instance_of(ClickUp::Tasks::Task)
      expect(result.last).to be_an_instance_of(ClickUp::Tasks::Task)
      expect(result.first.id).to eq("test1")
      expect(result.last.id).to eq("test2")
    end
  end
end
