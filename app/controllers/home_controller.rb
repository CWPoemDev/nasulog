class HomeController < ApplicationController
  def index
    redirect_to api_home_index_path and return if json_request?
    @poems = Poem.all.order(id: :desc).includes(:user).page(params[:page])
  end
end
