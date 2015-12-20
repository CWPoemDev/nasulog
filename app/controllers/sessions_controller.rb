class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']

    user = User.find_by(google_uid: auth[:uid])
    unless user
      user = User.create(google_uid: auth[:uid], name: auth[:info][:name], email: auth[:info][:email], image_url: auth[:info][:image])
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
