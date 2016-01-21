class PoemsController < ApplicationController
  before_filter :login_required
  before_action :set_poem, only: [:edit, :update]
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    redirect_to api_poems_path if json_request?
    @poems = Poem.where(user: current_user).order(created_at: :desc)
  end

  def show
    @poem = Poem.find(params[:id])
    @read_poems = ReadPoem.where(poem_id: params[:id])
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = PoemCreationService.create(current_user, poem_params, view_context: view_context)
    if @poem.valid?
      render :show and return if json_request?
      redirect_to @poem
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @poem.update(poem_params)
      render :show and return if json_request?
      redirect_to @poem
    else
      render :edit
    end
  end

  private

  def set_poem
    @poem = current_user.poems.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :description)
  end
end
