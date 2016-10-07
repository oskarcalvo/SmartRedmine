require 'sinatra/base'

module Sinatra
  module Ahah
    def select(name, options_list, selected_value = nil, multiple = nil)


      if options_list == nil
        return "<select #{multiple} class=\"#{name}\"  name=\"#{name}\"></select>"
      end



      html = ''
      options_list.each do |key, value|

        html << "<option value=\"#{key}\""
        html << " selected=\"true\"" if key == selected_value
        html << '>'
        html << value
        html << "</option>"
      end
      "<select #{multiple} class=\"#{name}\"  name=\"#{name}\">#{html}</select>"
    end
  end
  helpers Ahah
end
