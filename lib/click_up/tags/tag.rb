# frozen_string_literal: true

require "dry-struct"
require_relative "../types/base"

module ClickUp
  module Tasks
    Tag = Struct.new(:name, :tag_fg, :tag_bg, keyword_init: true)
  end
end
