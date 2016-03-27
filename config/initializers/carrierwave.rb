if ENV['AWS_KEY_ID'] && ENV['AWS_ACCESS_KEY'] && ENV['AWS_REGION'] && ENV['AWS_S3_BUCKET']
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_ACCESS_KEY'],
      :region                 => ENV['AWS_REGION']
    }

    config.fog_directory = ENV['AWS_S3_BUCKET']
  end
end
