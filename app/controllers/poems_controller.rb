class PoemsController < ApplicationController
  before_action :login_required
  before_action :set_poem, only: [:edit, :update, :destroy]

  def index
    @poems = Poem.all.order(id: :desc).includes(:user).page(params[:page])
  end

  def show
    @poem = Poem.find(params[:id])
    @image = Poemimage.find_by(poem_id: @poem.id)
    @read_poems = ReadPoem.where(poem_id: params[:id])
    @repoems = @poem.repoems.includes(:user)
  end

  def new
    @poem = Poem.new(original_poem_id: params[:poem_id])
    @poem.quote_original_poem
  end

  def create
    @poem = PoemCreationService.create(current_user, poem_params, view_context: view_context)
    @poemimage = Poemimage.new(image: poemimage_params[:image])
    @poemimage.poem_id = @poem.id
    @poemimage.save

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

      if poemimage_params[:image]
        @poemimage = Poemimage.find_by(poem_id: @poem.id)
        @poemimage.image = poemimage_params[:image]
        @poemimage.save
      end

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
    params.require(:poem).permit(:title, :description, :original_poem_id, :poemimages)
  end

  def poemimage_params
    params.require(:poem).require(:poemimages).permit(:image)
  end
end
