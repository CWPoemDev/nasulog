class Api::UsersController < Api::ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def auth_token
    render nothing: true, status: 401 and return if current_user.blank?
    @token = current_user.create_one_time_token
  end

  private

  def set_user
    @user = current_user
  end
end
