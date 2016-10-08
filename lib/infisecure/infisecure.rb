module Infisecure
  def call
  	begin
	  	infisecure_api_url = URI.parse(@lnis_api_url)
      header = {
      	'Content-Type' => 'application/json', 
      	'X-API-Key: ' => @lnis_auth_header,
      	'Content-Language' => 'en-US',
      	'Content-Encoding' => 'UTF-8'
      }
      https = Net::HTTP.new(@lnis_api_url.host,@lnis_api_url.port)
      req = Net::HTTP::Post.new(@lnis_api_url.request_uri, header)
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
      }
      res = https.request(req)
    rescue Exception => e
	  	puts "---->>>> Exception found #{e} <<<<----"
	  end 
  end
end