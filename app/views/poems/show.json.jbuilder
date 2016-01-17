json.poem do
  json.id @poem.id
  json.title @poem.title
  json.description @poem.description
  json.author do
    json.partial! 'shared_partials_json/user', user: @poem.user
  end
  json.read_users @read_poems do |read_poem|
    json.partial! 'shared_partials_json/user', user: read_poem.user
  end
  json.created_at @poem.created_at
end
