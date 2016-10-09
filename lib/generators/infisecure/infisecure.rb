Infisecure.configure do |config|
  file = File.read("#{Rails.root}/config/infisecure.yml")
  file_config = YAML.load(file)

  config.auth_code = file_config["auth_code"]
  config.secret_key = file_config["secret_key"]
  config.api_url = file_config["api_url"]
  config.js_data_url = file_config["js_data_url"]
end