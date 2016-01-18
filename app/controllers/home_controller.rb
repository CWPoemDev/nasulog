class HomeController < ApplicationController
  def index
    @poems = Poem.all.order(id: :desc).includes(:user)
    respond_to do |format|
      format.html
      format.json { render 'poems/index' }
    end
  end
end
