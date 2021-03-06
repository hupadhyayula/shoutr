Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  
  config.assets.debug = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :s3_region => ENV["AWS_REGION"],
    },
    :url => ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename"
  }

  config.after_initialize do
    Bullet.enable = true

    Bullet.rails_logger = true

    Bullet.bullet_logger = true
  end

  config.reload_classes_only_on_change = false

end
