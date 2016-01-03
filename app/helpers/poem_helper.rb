module PoemHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true)
    extensions = {}
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
