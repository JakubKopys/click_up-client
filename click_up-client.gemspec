# frozen_string_literal: true

require_relative "lib/click_up/client/version"

Gem::Specification.new do |spec|
  spec.name          = "click_up-client"
  spec.version       = ClickUp::Client::VERSION
  spec.authors       = ["Jakub Kopyś"]
  spec.email         = ["jakubkopys95@gmail.com"]

  spec.summary       = "ClickUp API Client"
  spec.homepage      = "https://github.com/JakubKopys/click_up-client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.3"

  spec.add_development_dependency "dotenv", "~> 2.7"
  spec.add_development_dependency "pry", "~> 0.13"
end
