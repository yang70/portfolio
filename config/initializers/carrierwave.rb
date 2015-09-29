CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],       # required
  }

if Rails.env.test?
  config.storage = :file
  config.enable_processing = false
  config.root = "#{Rails.root}/tmp"
else
  config.storage = :fog
end

  config.fog_directory  = ENV['S3_BUCKET']                     # required
  config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.s3_access_policy = :public_read
end
