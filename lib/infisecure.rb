require "infisecure/version"
require "infisecure/infisecure_api"
require 'securerandom'
module Infisecure
	class << self
    attr_accessor :configuration, :setup
  end

  mattr_accessor :auth_code
	mattr_accessor :api_url
	mattr_accessor :secret_key


  def self.setup
    yield self
  end

  def self.api(user_id, request, cookies)
  	api = Api.new(auth_code, api_url, secret_key, user_id, request, cookies)
  	api.call
  end

	class Api
		include InfisecureApi
		def initialize(auth_code, api_url, secret_key, user_id, request, cookies)
			lnisac0 = 0
      lniscc7 = 7
      lnisec10 = 10
      lnisgc20 = 20
	  	@min_number = 1000000001
	    @max_number = 9999999999
	  	@lnis_sub_code = auth_code || "" #subscription code
	  	@lnis_auth_header = secret_key || "" 
	  	@lnis_api_url = api_url || ""
	  	#@lnis_js_data_url = options[:js_data_url] || ""
	  	@lnisa2 = @lnis_sub_code[0..4] + "-"+ SecureRandom.uuid #
	  	@lnisa3 = request.env["HTTP_REFERER"] || "" 
	  	@lnisa4 = request.env["REQUEST_URI"] || ""
	  	@lnisa5 = request.session.id || ""
			@lnisa6 = request.env["REMOTE_ADDR"] || ""
			@lnisa7 = request.env["HTTP_USER_AGENT"] || ""
			@lnisa8 = request.env["REQUEST_METHOD"] || "" #request type
			@lnisa9 = user_id || "" #requested by
			@lnisa10 = (Time.now.to_i*1000).floor # time in miliseconds
			@lnisa11 = cookies[:lnisa11] || "a11-" + SecureRandom.uuid
			@lnisa12 = cookies[:lnisa12] || (Time.now.to_i*1000).floor #current_time in miliseconds
			@lnisa14 = cookies[:lnisa14] || (Time.now.to_i*1000).floor #current_time in miliseconds
			#set cookies expire time
			cookie_expire_time = Time.now + 3600*24*365*1 
			
			if (cookies[:lnisa11] && cookies[:lnisa12] && cookies[:lnisa13] && cookies[:lnisa14])
				if cookies[:lnisa13].to_s.length > 20 
	        lnisa13Value = (cookies[:lnisa13].to_s[lnisec10, cookies[:lnisa13].to_s.length-lnisgc20]).to_i
	        @lnisa13 = (rand(@min_number..@max_number).to_s + (lnisa13Value+lniscc7).to_s + rand(@min_number..@max_number).to_s).to_s
	        cookies[:lnisa13] = {:value => @lnisa13, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }					
	      end	
			else
				@lnisa13 = (rand(@min_number..@max_number).to_s + "0"+rand(@min_number..@max_number).to_s).to_s
				cookies[:lnisa11] = {:value => @lnisa11, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
	    	cookies[:lnisa12] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
	    	cookies[:lnisa13] = {:value => @lnisa13, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
	    	cookies[:lnisa14] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }    	
			end
			
			@lnisa15 =  request.query_string || ""
			@lnisa16 = request.remote_host || ""
			@lnisa17 = ""
	  end

	end
end