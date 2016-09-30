require ::File.join( ::File.dirname(__FILE__), 'app' )

require './app'

#use Rack::Session::Cookie, :secret => "Elefantes blancos volando por el fondo del mar"
#use Rack::Csrf, :raise => true


run SmartRedmine
