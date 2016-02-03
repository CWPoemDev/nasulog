class Api::PoemsController < Api::ApplicationController
  before_action :set_poem, only: [:show, :update, :destroy]

  def index
    @poems,@has_more = Poem.all.order(id: :desc).includes(:user).extending(LoadMorePagenation).load_more(:id, params[:last_id], params[:count])
  end

  def show
    @read_poems = ReadPoem.where(poem_id: params[:id])
  end

  def quote
    @poem = Poem.new(original_poem_id: params[:poem_id])
    @poem.quote_original_poem
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

  def destroy
    @poem.destroy
    render nothing: true, status: :no_content
  end

  private

  def set_poem
    @poem = Poem.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :description)
  end
end
