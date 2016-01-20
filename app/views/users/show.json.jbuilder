json.user do
  json.partial! 'shared_partials_json/user', user: @user
  json.email @user.email
end
