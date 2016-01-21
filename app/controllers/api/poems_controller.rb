class Api::PoemsController < Api::ApplicationController
  def index
    @poems = Poem.where(user: current_user).includes(:user)
  end
end
