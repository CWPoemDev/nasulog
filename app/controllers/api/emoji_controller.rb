class Api::EmojiController < ApplicationController
  before_filter :login_required
  def index
    @emojis = Emoji.start_with(params[:query])
  end
end
