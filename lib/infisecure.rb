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
    attr_accessor :auth_code, :secret_key, :api_url, :js_data_url

    def initialize
      @auth_code = ""
      @secret_key = ""
      @api_url = ""
      @js_data_url = ""
    end
  end

	class Api
		include InfisecureApi
		def initialize(options={})
			lnisac0 = 0
      lniscc7 = 7
      lnisec10 = 10
      lnisgc20 = 20
	  	@min_number = 1000000001
	    @max_number = 9999999999
	  	@lnis_sub_code = options[:auth_key] || "" #subscription code
	  	@lnis_auth_header = options[:secret_key] || "" 
	  	@lnis_api_url = options[:api_url] || ""
	  	@lnis_js_data_url = options[:js_data_url] || ""
	  	@lnisa2 = @lnis_sub_code[0..4] + "-"+ SecureRandom.uuid #
	  	@lnisa3 = options[:http_referer] || "" 
	  	@lnisa4 = options[:req_uri] || ""
	  	@lnisa5 = options[:session_id] || ""
			@lnisa6 = options[:request_ip] || ""
			@lnisa7 = options[:http_user_agent] || ""
			@lnisa8 = options[:request_method] || "" #request type
			@lnisa9 = options[:user] || "" #requested by
			@lnisa10 = Time.now.to_i.floor*1000 # time in miliseconds
			@lnisa11 = options[:lnisa11] || "a11-" + SecureRandom.uuid
			@lnisa12 = options[:lnisa12] || Time.now.to_i.floor #current_time
			if options[:lnisa13].length > 20 
        lnisa13Value = (options[:lnisa13].to_s[lnisec10, options[:lnisa13].length-lnisgc20]).to_i
        @lnisa13 = (rand(@min_number..@max_number).to_s + (lnisa13Value+lniscc7).to_s + rand(@min_number..@max_number).to_s).to_i 
      else
				@lnisa13 = (rand(@min_number..@max_number).to_s + "0"+rand(@min_number..@max_number).to_s).to_i
      end
			@lnisa14 = options[:lnisa14] || Time.now.to_i.floor #current_time
			@lnisa15 = options[:query_string] || ""
	  end
	end
end