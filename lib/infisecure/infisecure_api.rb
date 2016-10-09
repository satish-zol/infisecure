module InfisecureApi
  def call
  	begin
      lnisac0 = 0
      lniscc7 = 7
      lnisec10 = 10
      lnisgc20 = 20
	  	infisecure_api_url = URI.parse("http://"+@lnis_api_url)
      header = {
      	'Content-Type' => 'application/json', 
      	'X-API-Key ' => @lnis_auth_header,
      	'Content-Language' => 'en-US',
      	'Content-Encoding' => 'UTF-8'
      }
      https = Net::HTTP.new(infisecure_api_url.host,infisecure_api_url.port)
      req = Net::HTTP::Post.new(infisecure_api_url.path, initheader = header)
      req.body = {
      	lnisa1: @lnis_sub_code,
      	lnisa2: @lnisa2, 
      	lnisa3: @lnisa3,
      	lnisa4: @lnisa4,
      	lnisa5: @lnisa5,
      	lnisa6: @lnisa6,
      	lnisa7: @lnisa7,
      	lnisa8: @lnisa8,
      	lnisa9: @lnisa9,
      	lnisa10: @lnisa10,
      	lnisa11: @lnisa11,
      	lnisa12: @lnisa12,
      	lnisa13: @lnisa13,
      	lnisa14: @lnisa14,
      	lnisa15: @lnisa15
      }.to_json
      res = https.request(req)
      res = JSON.parse(res.body)
      res["upid"] = @lnisa2
      res["js_data_url"] = @lnis_js_data_url

      cookie_expire_time = Time.now.to_i.floor + 3600*24*365*1 

      if !cookies[:lnisa11].nil? && !cookies[:lnisa12].nil? && !cookies[:lnisa13].nil? && !cookies[:lnisa14].nil?
        cookies[:lnisa11] = @lnisa11 
        cookies[:lnisa12] = @lnisa12
        cookies[:lnisa14] = @lnisa14
        cookies[:lnisa13] = @lnisa13 

        if @lnisa13.length > 20 
          lnisa13Value = (@lnisa13.to_s[lnisec10, @lnisa13.length-lnisgc20]).to_i
          @lnisa13 = (rand(@min_number..@max_number).to_s + (lnisa13Value+lniscc7).to_s + rand(@min_number..@max_number).to_s).to_i 
        end
        cookies[:lnisa13] = {:value => @lnisa13, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
        cookies[:lnisa14] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
      else
        @lnisa11 = "a11-" + SecureRandom.uuid
        @lnisa13 = (rand(@min_number..@max_number).to_s + "0" + rand(@min_number..@max_number).to_s).to_i
        
        cookies[:lnisa11] = {:value => @lnisa11, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
        cookies[:lnisa12] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
        cookies[:lnisa13] = {:value => @lnisa13, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
        cookies[:lnisa14] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
      end
      return res
    rescue Exception => e
	  	puts "---->>>> Exception found #{e} <<<<----"
      puts e.message  
	  end 
  end
end