json.user do
  json.partial! 'api/shared_partials/user', user: @user
  json.email @user.email
end
