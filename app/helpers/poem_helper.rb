module PoemHelper
  # TODO: 他の箇所でも使うようになったら(コメントとか)
  #       ここじゃない場所に移した方が良さそう
  def markdown(text)
    renderer_extensions = {
      hard_wrap: true
    }
    renderer = Redcarpet::Render::HTML.new(renderer_extensions)
    markdown_extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      lax_spacig: true,
      strikethrough: true,
      footnotes: true
    }
    markdown = Redcarpet::Markdown.new(renderer, markdown_extensions)
    markdown.render(emojify(text)).html_safe
  end

  def emojify(content)
    return "" unless content.present?

    content.to_str.gsub(/:([\w+-]+):/) do |match|
      emoji_alias = Regexp.last_match(1)
      emoji = Emoji.find_by_alias(emoji_alias)
      if emoji
        %(<img alt="#{emoji_alias}" src="#{emoji_path(emoji)}" class="emoji" />)
      else
        match
      end
    end.html_safe
  end

  def emoji_path(emoji)
    image_path("emoji/#{emoji.image_filename}")
  end
end
