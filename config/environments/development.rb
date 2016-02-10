Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

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

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
