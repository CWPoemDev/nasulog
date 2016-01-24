class Api::PoemsController < Api::ApplicationController
  before_action :set_poem, only: [:show, :update]

  def index
    @poems,@has_more = Poem.where(user: current_user).includes(:user).extending(LoadMorePagenation).load_more(:id, params[:last_id], params[:count])
  end

  def show
    @read_poems = ReadPoem.where(poem_id: params[:id])
  end

  def create
    @poem = PoemCreationService.create(current_user, poem_params, view_context: view_context)
    if @poem.valid?
      render :show
    else
      render :json ,{ status: :error }, status: :bad_request
    end
  end

  def update
    if @poem.update(poem_params)
      render :show
    else
      render :json ,{ status: :error }, status: :bad_request
    end
  end

  private

  def set_poem
    @poem = Poem.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :description)
  end
end
