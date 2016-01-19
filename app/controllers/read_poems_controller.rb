class ReadPoemsController < ApplicationController
  before_filter :login_required
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    current_user.read_poems.create(poem_id: params[:poem_id])
    if json_request?
      render json: { status: :success }, status: :created
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.read_poems.destroy(params[:id])
    if json_request?
      render nothing: true, status: :no_content
    else
      redirect_to :back
    end
  end

  private
  
  def json_request?
    request.format.json?
  end
end
