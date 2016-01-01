module PoemHelper
  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  end
end
