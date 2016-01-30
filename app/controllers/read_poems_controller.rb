class ReadPoemsController < ApplicationController
  def index
    @read_poems = Poem.joins(:read_poems).where(read_poems: { user: current_user} ).uniq.order(created_at: :DESC)
  end

  def create
    current_user.read_poems.create(poem_id: params[:poem_id])
    redirect_to :back
  end

  def destroy
    current_user.read_poems.destroy(params[:id])
    redirect_to :back
  end
end
