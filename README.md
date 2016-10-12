# Infisecure

Welcome to Infisecure gem! This gem will call the infisecure server with give parameters.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'infisecure', git: 'git@github.com:satish-zol/infisecure.git', branch: 'master'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install infisecure

## Usage

	rails g infisecure:install

create a file in app/assets/javascripts/infisecure.js and add the below code in infisecure.js
	
	window.Infisecure = function(lnisj1, secret_key, lnisjs_post_target) {
	  function _lnisj_init_post(_) {
	  var lnisjPost;
	  lnisjPost = window.XMLHttpRequest ? new XMLHttpRequest : new ActiveXObject(
	    "Microsoft.XMLHTTP"), lnisjPost
	    .open("POST", lnisjs_post_target, !0), lnisjPost.setRequestHeader(
	    "Content-type", "application/json"),
	    lnisjPost.setRequestHeader("X-API-Key", secret_key), lnisjPost
	    .send(_)
	  }

	  var _lnisj1 = "", _lnisj2 = "", _lnisj3 = "", _lnisj4 = "", _lnisj5 = "", _lnisj6 = "";
	  _lnisj1 = lnisj1;
	  _lnisj2 = encodeURIComponent(navigator.appCodeName);
	  _lnisj3 = encodeURIComponent(navigator.appVersion);
	  _lnisj4 = encodeURIComponent(navigator.cookieEnabled);
	  _lnisj5 = encodeURIComponent(navigator.platform);
	  _lnisj6 = encodeURIComponent(navigator.language);
	  var a ='{"lnisj1":"'+_lnisj1+'", "lnisj2":"'+_lnisj2+'", "lnisj3":"'+_lnisj3+'", "lnisj4":"'+_lnisj4+'", "lnisj5":"'+_lnisj5+'", "lnisj6":"'+_lnisj6+'"}'
	  return _lnisj_init_post(a);
	};

include below code in application.js
	
	//= require infisecure

add below code into the controller method e.g. home_controller.rb
	
	options = {
      auth_key: Infisecure.configuration.auth_code,
      secret_key: Infisecure.configuration.secret_key,
      api_url: Infisecure.configuration.api_url,
      js_data_url: Infisecure.configuration.js_data_url,
      http_referer: request.env["HTTP_REFERER"],
      req_uri: request.env["REQUEST_URI"],
      session_id: request.session.id,
      request_ip: request.env["REMOTE_ADDR"],
      http_user_agent: request.env["HTTP_USER_AGENT"],
      request_method: request.env["REQUEST_METHOD"],
      user: 1, #current_user.id
      query_string: request.query_string,
      lnisa11: cookies[:lnisa11] || nil,
      lnisa12: cookies[:lnisa12] || nil,
      lnisa13: cookies[:lnisa13] || "",
      lnisa14: cookies[:lnisa11] || nil
    }
    i = Infisecure::Api.new options
    @res = i.call
    #set cookies with expire time
    cookie_expire_time = Time.now + 3600*24*365*1 
    cookies[:lnisa11] = {:value => @res["lnisa11"], :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
    cookies[:lnisa12] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
    cookies[:lnisa13] = {:value => @res["lnisa13"], :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }
    cookies[:lnisa14] = {:value => Time.now.to_i.floor, :expires => cookie_expire_time, :path => '/', :secure => false, :httponly => true }

add the below code in script tag in your views e.g. index.html.erb
	
	var infisecure = new Infisecure('<%= @res["upid"] %>', '<%= Infisecure.configuration.secret_key %>', '<%= @res["js_data_url"] %>' );

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satish-zol/infisecure. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

