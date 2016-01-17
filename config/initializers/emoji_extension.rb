# emojiに検索メソッドを追加
module Emoji
  def start_with(name, limit = 10)
    emojis = Emoji.all.select do |emoji|
      emoji.aliases.any? do |_alias|
        _alias =~ /^#{name}/
      end
    end
    emojis.sort_by{ |e| e.name }.first(limit)
  end
end
