# NasuLog API
module Api
  # this controller returns emoji infomation
  # ex.
  # [
  #   {
  #     "value": "octocat",
  #     "url": "/assets/emoji/octocat-<digest>.png"
  #   }
  # ]
  class EmojiController < ApplicationController
    before_action :login_required
    def index
      @emojis = Emoji.start_with(params[:query])
    end
  end
end
