shared_context 'after login', login_as: :current_user do
  before do
    request.env['HTTPS'] = 'on'
    session[:user_id] = current_user.id
  end
end
