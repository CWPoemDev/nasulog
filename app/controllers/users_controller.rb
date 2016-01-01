# ユーザー情報を編集する
class UsersController < ApplicationController
  before_action :login_required
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: I18n.t('users.updated')
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
