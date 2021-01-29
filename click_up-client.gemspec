# frozen_string_literal: true

require_relative "lib/click_up/client/version"

Gem::Specification.new do |spec|
  spec.name          = "click_up-client"
  spec.version       = ClickUp::Client::VERSION
  spec.authors       = ["Jakub Kopyś"]
  spec.email         = ["jakubkopys95@gmail.com"]

  # TODO
  spec.summary       = "Write a short summary, because RubyGems requires one."
  spec.description   = "Write a longer description or delete this line."
  spec.homepage      = "http://todo.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  # TODO: specify
  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  # TODO: specify
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  # end
  spec.files = %w[lib/click_up/client.rb lib/click_up/client/test.rb lib/click_up/client/version.rb]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.3"

  spec.add_development_dependency "dotenv", "~> 2.7"
  spec.add_development_dependency "pry"
end
