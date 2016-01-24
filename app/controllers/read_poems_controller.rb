class ReadPoemsController < ApplicationController
  before_filter :login_required
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    redirect_to api_poem_read_poems_path and return if json_request?
    current_user.read_poems.create(poem_id: params[:poem_id])
    redirect_to :back
  end

  def destroy
    redirect_to api_read_poem and return if json_request?
    current_user.read_poems.destroy(params[:id])
    redirect_to :back
  end
end
