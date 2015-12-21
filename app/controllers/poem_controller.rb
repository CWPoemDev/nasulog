class PoemController < ApplicationController
  before_filter :login_required

  def index
    @poems = Poem.where(users_id: @current_user.id)
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(users_id: @current_user.id ,title: params[:poem][:title], description: params[:poem][:description])
    redirect_to @poem
  end

  def edit
  end

  def update
  end
end
