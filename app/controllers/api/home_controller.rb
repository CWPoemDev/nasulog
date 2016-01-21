class Api::HomeController < Api::ApplicationController
  def index
    @poems = Poem.all.order(id: :desc).includes(:user)
    render "#{api_poems_path}/index"
  end
end
