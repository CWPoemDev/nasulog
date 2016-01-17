json.poems @poems do |poem|
  json.id poem.id
  json.title poem.title
  json.author do
    json.partial! 'shared_partials_json/user', user: poem.user
  end
  json.created_at poem.created_at
end
