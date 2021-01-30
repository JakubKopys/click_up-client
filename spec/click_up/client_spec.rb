# frozen_string_literal: true

RSpec.describe ClickUp::Client do
  it "has a version number" do
    expect(ClickUp::Client::VERSION).not_to be nil
  end

  describe "#tasks" do
    context "when default_list_id is provided" do
      it "returns TasksService instance with default_list_id" do
        client = described_class.new(api_token: "fake_token", default_list_id: 123)

        result = client.tasks

        expect(result).to be_an_instance_of(ClickUp::Client::TasksService)
        expect(result.list_id).to eq(123)
      end
    end

    context "when default_list_id is not provided" do
      context "when list_id is not passed to #tasks" do
        it "raises an ArgumentError" do
          client = described_class.new(api_token: "fake_token")

          expect do
            client.tasks
          end.to raise_error(ArgumentError, "list_id can't be nil when default_list_id was not provided")
        end
      end

      context "when list_id is passed to #tasks" do
        it "returns TasksService instance with provided list_id" do
          client = described_class.new(api_token: "fake_token")

          result = client.tasks(list_id: 345)

          expect(result).to be_an_instance_of(ClickUp::Client::TasksService)
          expect(result.list_id).to eq(345)
        end
      end
    end
  end
end
