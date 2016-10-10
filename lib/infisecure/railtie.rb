require "infisecure/view_helpers"
module Infisecure
  class Railtie < Rails::Railtie
    initializer "infisecure" do |app|
      ActionController::Base.send :include Infisecure::ScriptInserter      
      ActionController::Base.after_filter :insert_infisecurejs
      ActionView::Base.send :include, ViewHelpers
    end
  end
end