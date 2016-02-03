json.poem do
  json.id @poem.id
  json.title @poem.title
  json.description @poem.description
  json.author do
    json.partial! 'api/shared_partials/user', user: @poem.user
  end
  json.read_users @read_poems do |read_poem|
    json.partial! 'api/shared_partials/user', user: read_poem.user
  end
  json.created_at @poem.created_at
  json.original_poem_id @poem.original_poem_id
end
