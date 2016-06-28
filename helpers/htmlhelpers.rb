module HtmlHelpers
  def select(name, option_list, selected_value)

    html = ''
    options_list.each do |nv_pair|
      option_value = nv_pair[0]
      option_name = nv_pair[1]
      html << "<option value=\"#{option_value}\""
      html << " selected=\"true\"" if option_value == selected_value
      html << '>'
      html << option_name
      html << "</option>"
    end
    "<select class=\"#{name}\"  name=\"#{name}\">#{html}</select>"
  end

  module_function :HtmlHelpers
end
