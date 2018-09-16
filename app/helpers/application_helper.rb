
module ApplicationHelper
class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def block_code(code, language)
    Rouge.highlight(code, language || 'text', 'html')
  end
end

def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" }
    }

    extensions = {
      autolink:           true,
      highlight:          true,
      superscript:        true,
      disable_indented_code_blocks: true,
      space_after_headers: true,
      fenced_code_blocks: true
    }

    #renderer = Redcarpet::Render::HTML.new(options)
    renderer = HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
