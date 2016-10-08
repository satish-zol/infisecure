Infisecure.setup do |config|
  file = File.read("#{Rails.root}/config/infisecure.yml")
  file_config = YAML.load(file)

  config.lnis_sub_code = file_config[Rails.env][:lnis_sub_code]
  config.lnis_auth_header = file_config[Rails.env][:lnis_auth_header]
  config.lnis_api_url = file_config[Rails.env][:lnis_api_url]
end