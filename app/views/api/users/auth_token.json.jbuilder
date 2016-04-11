json.auth_token do
  json.user @token.user.email
  json.token @token.token
  json.expires_at @token.expires_at.to_i
end
