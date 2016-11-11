module Redmine

  class Connect2API

    # el atributo args es un hash que tiene dos opciones:
    # Se pasa vacio
    # Se pasa un hash con dos elementos user y pass

    class << self
      def get (path, args = {})

        uri = URI.parse( redmine_uri + path )
        req = Net::HTTP::Get.new(uri)
        response = nil

        if args[:user] && args[:pass]
          req.basic_auth args[:user], args[:pass]
        end

        res = Net::HTTP.start(uri.hostname, uri.port) {|http|	  response = http.request(req)	}

      end


      def put (path, args = {})

        uri = URI.parse( redmine_uri + path )
        req = Net::HTTP::Put.new(uri,  'Content-Type' => 'application/json' )
        req.body = args.to_json

        if args[:user] && args[:pass]
          req.basic_auth args[:user], args[:pass]
        end

        res = Net::HTTP.start(uri.hostname, uri.port)  {|http|	  response = http.request(req)	}

        return res
      end


      def post (path, args = {})

        uri = URI.parse( redmine_uri + path )
        req = Net::HTTP::Post.new(uri,  'Content-Type' => 'application/json' )
        req.body = args.to_json

        if args[:user] && args[:pass]
          req.basic_auth args[:user], args[:pass]
        end

        res = Net::HTTP.start( uri.hostname, uri.port )  {|http|	  response = http.request(req)	}

        return res
      end

      def redmine_uri
        @uri ||= ENV['REDMINE_URI'] || redmine_url
      end

      private

      def redmine_url
        YAML.load_file( SmartRedmine::ROOT + "/conf/config.yaml" )['config']['url']
      end
    end
  end
end
