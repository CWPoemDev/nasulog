class Api::ReadPoemsController < Api::ApplicationController
  def create
    current_user.read_poems.create(poem_id: params[:poem_id])
    render json: { status: :success }, status: :created
  end

  def destroy
    current_user.read_poems.destroy(params[:id])
    render nothing: true, status: :no_content
  end
end
