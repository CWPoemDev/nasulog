json.poems @poems do |poem|
  json.id poem.id
  json.title poem.title
  json.author do
    json.partial! 'api/shared_partials/user', user: poem.user
  end
  json.created_at poem.created_at
end
json.has_more @has_more
