class ReadPoemsController < ApplicationController
  before_filter :login_required
  skip_before_action :verify_authenticity_token, if: :json_request?

  #POST /read_poemsをリロードしてGET /read_poems になってしまったとき
  def index
    redirect_to controller: :poems, action: :show, id: params[:poem_id]
  end

  #DELETE /read_poems/:id をリロードしてGET /read_poems になってしまったとき
  def show
    read_poem = ReadPoem.find(params[:id])
    redirect_to controller: :poems, action: :show, id: read_poem.poem_id
  end

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
end
