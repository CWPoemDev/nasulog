class User::PoemsController < ApplicationController
  before_action :login_required

  def index
    @poems = Poem.eager_load(:read_poems).where(user: current_user).order(created_at: :desc).page(params[:page])
  end
end
