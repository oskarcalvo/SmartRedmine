require 'sinatra/base'

module Sinatra
  module CsrfTag
    def csrf_tag
      Rack::Csrf.csrf_tag(env)
    end
  end
  helpers CsrfTag
end

module Sinatra
  module CsrfToken
    def csrf_token
      Rack::Csrf.csrf_token(env)
    end
  end
  helpers CsrfToken
end
