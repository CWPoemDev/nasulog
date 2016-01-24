class Api::PoemsController < Api::ApplicationController
  def index
    @poems,@has_more = Poem.where(user: current_user).includes(:user).extending(LoadMorePagenation).load_more(:id, params[:last_id], params[:count])
  end

  def show
    @poem = Poem.find(params[:id])
    @read_poems = ReadPoem.where(poem_id: params[:id])
  end
end
