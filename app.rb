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



require_relative 'libs/redmine_user.rb'
require_relative 'libs/redmine_issues.rb'
require_relative 'libs/redmine_journals.rb'
require_relative 'helpers/init'



class SmartRedmine < Sinatra::Base
  helpers Sinatra::CleanHash
  helpers Sinatra::Ahah
  
  ROOT = File.dirname(__FILE__)

  configure do

    set :ROOT, File.dirname(__FILE__)

    set :bind, '0.0.0.0'

    enable :sessions

    set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]


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
    redirect('login') unless is_authenticated?
  end

  def is_authenticated?
    #binding.pry
    return !!session[:session_id]
  end


end

require_relative 'routes/init'
