module Infisecure
	class InfisecureGenerator < Rails::Generators::Base
	  source_root(File.expand_path(File.dirname(__FILE__))
	  def copy_initializer_file
	    copy_file 'infisecure_credentials.rb', 'config/initializers/infisecure_credentials.rb'
	    copy_file 'infisecure.yml', 'config/infisecure.yml'
	  end
	end
end