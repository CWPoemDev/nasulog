json.poem do
  json.title @poem.title
  json.description @poem.description
  json.original_poem_id @poem.original_poem_id
end
