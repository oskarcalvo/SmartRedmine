require 'sinatra/base'

module Sinatra
  module MarkdownHelper
    def markdown_clean(notes)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      return markdown.render(notes)
    end
  end
  helpers MarkdownHelper
end
