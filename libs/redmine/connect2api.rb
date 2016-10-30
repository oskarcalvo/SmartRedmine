module Redmine
  class Connect2API
    # el atributo args es un hash que tiene dos opciones:
    # Se pasa vacio
    # Se pasa un hash con dos elementos user y pass
    def connect (path, args = {})
      uri = URI.parse(path)
      req = Net::HTTP::Get.new(uri)

      if args[:user] && args[:pass]
        req.basic_auth args[:user], args[:pass]
      end

      Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
    end


    def put (path, args = {})
      uri = URI.parse(path)
      req = Net::HTTP::Put.new(uri,  'Content-Type' => 'application/json' )
      req.body = args.to_json

      if args[:user] && args[:pass]
        req.basic_auth args[:user], args[:pass]
      end

      Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
    end


    def post (path, args = {})
      uri = URI.parse(path)
      req = Net::HTTP::Post.new(uri,  'Content-Type' => 'application/json' )
      req.body = args.to_json

      if args[:user] && args[:pass]
        req.basic_auth args[:user], args[:pass]
      end

      Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
    end
  end
end

