require "infisecure/version"
require "infisecure/infisecure_api"
require 'securerandom'
module Infisecure
	class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :auth_code, :secret_key, :api_url

    def initialize
      @auth_code = ""
      @secret_key = ""
      @api_url = ""
    end
  end

	class Api
		include InfisecureApi
		def initialize(options={})
	  	@min_number = 1000000001
	    @max_number = 9999999999
	  	@lnis_sub_code = options[:auth_key] || ""
	  	@lnis_auth_header = options[:secret_key] || ""
	  	@lnis_api_url = options[:api_url] || ""
	  	@lnisa2 = @lnis_sub_code[0..4] + "-"+ SecureRandom.uuid 
	  	@lnisa3 = options[:http_referer] || ""
	  	@lnisa4 = options[:req_uri] || ""
	  	@lnisa5 = options[:session_id] || ""
			@lnisa6 = options[:request_ip] || ""
			@lnisa7 = options[:http_user_agent] || ""
			@lnisa8 = ""
			@lnisa9 = ""
			@lnisa10 = Time.now.to_i*1000
			@lnisa11 = "a11-" + SecureRandom.uuid
			@lnisa12 = Time.now.to_i
			@lnisa13 = rand(@min_number..@max_number)
			@lnisa14 = Time.now.to_i
			@lnisa15 = "utm_source=pbw&utm_medium=cpc&utm_campaign=pbw"
	  end
	end

	
end