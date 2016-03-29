unless Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_ACCESS_KEY'],
      :region                 => ENV['AWS_REGION']
    }

    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_public = false
    config.fog_authenticated_url_expiration = 600
  end
end
