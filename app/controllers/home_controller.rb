class HomeController < ApplicationController
  before_filter :login_required

  def index
    @poems = Poem.all.order(id: :desc).includes(:user)
  end
end
