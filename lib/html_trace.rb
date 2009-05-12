module ActionView
  module Partials
    private
    # render :partial => "item", :collection => @items
    def render_partial_with_html_trace(partial_path, *args)
      "<!-- #{partial_path.upcase} -->\n" + render_partial_without_html_trace(partial_path, *args) + "\n<!-- #{partial_path.downcase} -->"
    end
    alias_method_chain :render_partial, :html_trace
  end
end

module ActionController
  class Base
    # render_for_file(template_path, status = nil, use_full_path = false, locals = {})
    def render_for_file_with_html_trace(template_path, *args)
      "\n<!-- #{template_path.upcase} -->\n" + render_for_file_without_html_trace(template_path, *args) + "\n<!-- #{template_path.downcase} -->"
    end
    alias_method_chain :render_for_file, :html_trace
  end
end    