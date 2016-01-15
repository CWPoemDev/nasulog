class ReadPoemsController < ApplicationController
  before_filter :login_required

  def create
    current_user.read_poems.create(poem_id: params[:poem_id])
    redirect_to :back
  end

  def destroy
    ReadPoem.destroy(params[:id])
    redirect_to :back
  end
end
