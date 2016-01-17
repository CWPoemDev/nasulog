json.array!(@emojis) do |emoji|
  json.value emoji.name
  json.url emoji_path(emoji)
end
