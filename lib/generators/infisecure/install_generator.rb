module Infisecure
	class InstallGenerator < Rails::Generators::Base
	  # source_root(File.expand_path(File.dirname(__FILE__)))
	  source_root File.expand_path("../templates", __FILE__)

	  desc "Creates infisecure initializer"

	  def copy_initializer_file
	  	puts "Server name: "
    	puts "    1. Asia/India - sg.infisecure.com"
    	puts "    2. North America - us.infisecure.com"
    	puts "    3. Europe - eu.infisecure.com"
    	server_code = gets.chomp
  		case server_code.to_i
  		when 1
  			@server_name = "sg.infisecure.com"
  		when 2
  			@server_name = "us.infisecure.com"
  		when 3
  			@server_name = "eu.infisecure.com"
  		else
  			@server_name = "us.infisecure.com"
  		end
      puts "Sid: "
      @auth_code = gets.chomp
	    copy_file 'infisecure.rb', 'config/initializers/infisecure_config.rb', :force => true
	    # copy_file 'infisecure.yml', 'config/infisecure.yml', :force => true
	  end
	end
end