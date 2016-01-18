Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true

  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load

  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  config.action_mailer.default_url_options = { host: "localhost:3000" }
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   address:               'smtp.sendgrid.net',
  #   port:                  '587',
  #   domain:                'heroku.com',
  # 	user_name:             ENV["SENDGRID_USERNAME"],
  # 	password:              ENV["SENDGRID_PASSWORD"],
  # 	authentication:        'plain',
  # 	enable_starttls_auto:  true
  # }
end
