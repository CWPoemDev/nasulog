class Api::User::PoemsController < Api::ApplicationController
  def index
    @poems,@has_more = Poem.where(user: current_user).includes(:user).extending(LoadMorePagenation).load_more(:id, params[:last_id], params[:count])
    render "#{api_poems_path}/index"
  end
end
