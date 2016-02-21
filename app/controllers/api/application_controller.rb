require 'load_more_pagenation'

class Api::ApplicationController < ApplicationController
  before_action :login_required
  skip_before_action :verify_authenticity_token
end
