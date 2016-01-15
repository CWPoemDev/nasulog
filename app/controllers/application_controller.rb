class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def login_required
    redirect_to root_path, notice: 'ログインしてください' unless current_user
  end

  def current_user
    return @current_user if @current_user
    @current_user = User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    session.delete(:user_id)
    nil
  end
end
