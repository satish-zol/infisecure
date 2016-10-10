require 'erb'

module Infisecure
  module ViewHelpers
    include ActionView::Helpers::OutputSafetyHelper

    def render_infisecurejs options={}
      binding.local_variable_set(:options, options.to_json)
      template_file = ::File.read(::File.expand_path('../templates/infisecure.erb', __FILE__))
      raw ERB.new(template_file).result(binding)
    end
  end
end