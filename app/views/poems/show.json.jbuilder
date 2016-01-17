json.poem do
  json.id @poem.id
  json.title @poem.title
  json.description @poem.description
  json.read_users @read_poems do |read_poem|
    json.partial 'shared_partials_json/user', user: read_poem.user
  end

end
