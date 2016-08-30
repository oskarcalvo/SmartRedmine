require 'sinatra'
require 'net/http'
require 'uri'
require 'yaml'
require 'pry'
require 'json'
require 'sinatra/assetpack'
require 'redcarpet'
require 'rerun'
require "sinatra/cookies"
require "sinatra/flash"



require_relative 'libs/redmine_user.rb'
require_relative 'libs/redmine_issues.rb'
require_relative 'libs/redmine_journals.rb'
require_relative 'libs/redmine_connect2api.rb'
require_relative 'helpers/init'



class SmartRedmine < Sinatra::Base
  helpers Sinatra::CleanHash
  helpers Sinatra::Ahah
  helpers Sinatra::Cookies

  ROOT = File.dirname(__FILE__)

  configure do

    set :ROOT, File.dirname(__FILE__)
    set :bind, '0.0.0.0'
    enable :sessions
    register Sinatra::Flash
    set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]
    enable :method_override

      register Sinatra::AssetPack
      assets do
        serve '/js', :from => 'asset/js'
        js :application, [
          '/js/jquery.js',
          '/js/foundation.min.js',
          '/js/easyredmine.js',
          '/js/vendor/*.js'
        ]

        serve '/css', :from => 'asset/css'
        css :application, ['/css/*.css']
      end



  end

  before do
    @config = YAML.load_file("conf/config.yaml")
  end

  def require_logged_in
   # binding.pry
    redirect('login') if is_not_authenticated?
  end

  def is_not_authenticated?
    #binding.pry
    return session[:user].nil?
  end


end
require_relative 'routes/init'
