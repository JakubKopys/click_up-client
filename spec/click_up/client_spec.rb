# frozen_string_literal: true

RSpec.describe ClickUp::Client do
  it "has a version number" do
    expect(ClickUp::Client::VERSION).not_to be nil
  end

  it "does something useful" do
    api_token = ENV.fetch('CLICK_UP_API_TOKEN')

    client = described_class.new(api_token: api_token)

    expect(client.api_token).to eq(api_token)
  end
end
