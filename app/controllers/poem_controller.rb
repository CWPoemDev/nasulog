class PoemController < ApplicationController
  before_filter :login_required
  helper_method :is_mine

  def index
    @poems = Poem.where(user_id: @current_user.id).order(created_at: :desc)
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(user_id: @current_user.id ,title: params[:poem][:title], description: params[:poem][:description])
    redirect_to @poem
  end

  def edit
    @poem = Poem.find(params[:id])
  end

  def update
    @poem = Poem.find(params[:id])
    @poem.update(title: params[:poem][:title], description: params[:poem][:description])
    redirect_to @poem
  end

  private

  def is_mine
    @is_mine = Poem.find(params[:id]).user_id == @current_user.id
  end
end
