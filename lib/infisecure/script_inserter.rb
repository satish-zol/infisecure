module Infisecure
  module ScriptInserter
    BODY_TAG = %r{</body>}

    JS_SCRIPT = %q{
      <script src='infisecure.js'></script>
      <script>
        var lnisj1 = '<%= @res["upid"] %>';
        var lnisjs_post_target = '<%= @res["js_data_url"] %>';
        var infisecure = new Infisecure(lnisj1, lnisjs_post_target);
      </script>   
    }

    def insert_infisecurejs
      if (
        response.content_type == 'text/html' &&
        response.body.match(BODY_TAG)
      )
        response.body = response.body.gsub(BODY_TAG, JS_SCRIPT + '\\0')
      end      
    end
  end
end