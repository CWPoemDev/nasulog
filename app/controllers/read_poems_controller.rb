class ReadPoemsController < ApplicationController
  before_filter :login_required

  def create
    ReadPoem.create(poem_id: params[:format], user_id: current_user.id)
    redirect_to :back
  end

  def destroy
    ReadPoem.destroy(params[:id])
    redirect_to :back
  end
end
