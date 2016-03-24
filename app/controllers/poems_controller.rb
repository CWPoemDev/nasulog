class PoemsController < ApplicationController
  before_action :login_required
  before_action :set_poem, only: [:edit, :update, :destroy]
  before_action :set_search_params, only: [:index]

  def index
    @poems = Poem.search(@search_params).page(params[:page]).records
  end

  def show
    @poem = Poem.find(params[:id])
    @read_poems = ReadPoem.where(poem_id: params[:id])
    @repoems = @poem.repoems.includes(:user)
  end

  def new
    @poem = Poem.new(original_poem_id: params[:poem_id])
    @poem.quote_original_poem
  end

  def create
    @poem = PoemCreationService.create(current_user, poem_params, view_context: view_context)
    if @poem.valid?
      redirect_to @poem
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @poem.update(poem_params)
      redirect_to @poem
    else
      render :edit
    end
  end

  def destroy
    @poem.destroy
    redirect_to poems_path
  end

  private

  def set_poem
    @poem = current_user.poems.find(params[:id])
  end

  def set_search_params
    @search_params = params[:search] || {}
  end

  def poem_params
    params.require(:poem).permit(:title, :description, :original_poem_id)
  end
end
