class PoemsController < ApplicationController
  before_filter :login_required
  before_action :set_poem, only: [:edit, :update]
  helper_method :is_mine

  def index
    @poems = Poem.where(user_id: @current_user.id).order(created_at: :desc)
  end

  def show
    @poem = Poem.find(params[:id])
    @read_poems = ReadPoem.where(poem_id: params[:id])
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = current_user.poems.build(poem_params)
    if @poem.save
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

  private

  def set_poem
    @poem = current_user.poems.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :description)
  end

  def is_mine
    @is_mine = Poem.find(params[:id]).user_id == @current_user.id
  end
end
