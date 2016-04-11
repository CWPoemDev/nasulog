require 'load_more_pagenation'

class Api::ApplicationController < ApplicationController
  before_action :login_required
  skip_before_action :verify_authenticity_token

  private

  def current_user
    session[:user_id] = User.find_by(email: param_email).id if session[:user_id].blank? && valid_token_request?
    super
  end

  def valid_token_request?
    return false unless param_email.present? && param_token.present?

    token = OneTimeToken.valid.find_by(token: param_token)
    return token.try(:user).try(:email) == param_email
  end

  def param_email
    request.headers["x-nasulog-auth-user"] || params["auth_user"]
  end

  def param_token
    request.headers["x-nasulog-auth-token"] || params["auth_token"]
  end
end
