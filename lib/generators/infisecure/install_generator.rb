module Infisecure
	class InstallGenerator < Rails::Generators::Base
	  source_root(File.expand_path(File.dirname(__FILE__)))
	  def copy_initializer_file
	    copy_file 'infisecure.rb', 'config/initializers/infisecure.rb', :force => true
	    copy_file 'infisecure.yml', 'config/infisecure.yml', :force => true
	    File.open(Rail.root)
	  end
	end
end