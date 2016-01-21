class Api::HomeController < Api::ApplicationController
  def index
    @poems,@has_more = Poem.all.order(id: :desc).includes(:user).extending(LoadMorePagenation).load_more(:id, params[:last_id], params[:count])
    render "#{api_poems_path}/index"
  end
end
