Rails.application.config.middleware.use OmniAuth::Builder do
  options = { hd: ENV["RESTRICT_DOMAIN"], name: 'google' }
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], options
end
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
