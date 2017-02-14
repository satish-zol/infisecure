module InfisecureApi
  def call
  	begin
	  	infisecure_api_url = URI.parse("http://"+@lnis_api_url+"/api/v1/analyze-requests")
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
      	lnisa15: @lnisa15,
        lnisa16: @lnisa16, #hostname
        lnisa17: @lnisa17
      }.to_json
      
      res = https.request(req)
      res = JSON.parse(res.body)
      res["upid"] = @lnisa2
      res["secret_key"] = @lnis_auth_header
      res["lnisa11"] = @lnisa11
      res["lnisa12"] = @lnisa12
      res["lnisa13"] = @lnisa13
      res["lnisa14"] = @lnisa14
      res["js_data_url"] = "http://"+@lnis_api_url+"/api/process-js-request" 
      return res
    rescue Exception => e
	  	puts "---->>>> Exception found #{e} <<<<----"
      puts e.message  
	  end 
  end
end