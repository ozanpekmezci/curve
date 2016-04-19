CarrierWave.configure do |config|
 config.fog_provider = 'fog/aws'
 config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     "asdadsfasdfdfgfsg",#ENV['AWS_ACCESS_KEY_ID'],                        #	"asdadsfasdfdfgfsg",#
    aws_secret_access_key: "sdfasdfsdfgsdhsthwetqrwgwebwerbwerb",#ENV['AWS_SECRET_ACCESS_KEY'],                       # 	"sdfasdfsdfgsdhsthwetqrwgwebwerbwerb",#
    region:                'eu-central-1'                  # optional, defaults to 'us-east-1'
  #  host:                  's3.example.com',             # optional, defaults to nil
  #  endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'curve-app'                          # required
#  config.fog_public     = false                                        # optional, defaults to true
#  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}

#  config.permissions = 0666
#  config.directory_permissions = 0777
#  config.storage = :file
end
