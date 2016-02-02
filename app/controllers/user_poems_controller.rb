class UserPoemsController < ApplicationController
  before_filter :login_required

  def index
    @poems = Poem.where(user: current_user).order(created_at: :desc)
  end
end
