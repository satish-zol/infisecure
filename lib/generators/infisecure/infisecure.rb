Infisecure.configure do |config|
  file = File.read("#{Rails.root}/config/infisecure.yml")
  file_config = YAML.load(file)

  config.auth_code = file_config[Rails.env][:lnis_sub_code]
  config.secret_key = file_config[Rails.env][:lnis_auth_header]
  config.api_url = file_config[Rails.env][:lnis_api_url]
end