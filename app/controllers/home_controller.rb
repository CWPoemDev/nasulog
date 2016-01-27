class HomeController < ApplicationController
  def index
    @poems = Poem.all.order(id: :desc).includes(:user).page(params[:page])
  end
end
