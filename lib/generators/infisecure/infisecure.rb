Infisecure.configure do |config|
  config.auth_code = "<%= @auth_code %>"
  config.secret_key = "<%= @secret_key %>"
  config.api_url = '<%= @server_name %>'
end