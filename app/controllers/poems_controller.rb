class PoemsController < ApplicationController
  before_action :set_poem, only: [:edit, :update, :destroy]

  def index
    @poems = Poem.all.order(id: :desc).includes(:user).page(params[:page])
  end

  def show
    @poem = Poem.find(params[:id])
    @read_poems = ReadPoem.includes(:user).where(poem_id: params[:id])
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

  def poem_params
    params.require(:poem).permit(:title, :description, :original_poem_id)
  end
end
