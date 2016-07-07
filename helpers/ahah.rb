require 'sinatra/base'

module Sinatra
  module Ahah
    def select(name, options_list, selected_value)

      html = ''
      options_list.each do |key, value|
        
        html << "<option value=\"#{key}\""
        html << " selected=\"true\"" if key == selected_value
        html << '>'
        html << value
        html << "</option>"
      end
      "<select class=\"#{name}\"  name=\"#{name}\">#{html}</select>"
    end
  end
  helpers Ahah
end
