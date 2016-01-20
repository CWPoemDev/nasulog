# NasuLog Api
module Api
  # return markdown preview
  class MarkdownPreviewsController < ApplicationController
    before_action :login_required
    protect_from_forgery except: :create

    def create
      render html: view_context.markdown(params[:text])
    end
  end
end
