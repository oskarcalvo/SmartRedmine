require 'sinatra'
require 'net/http'
require 'uri'
require 'yaml'
require 'pry'
require 'json'
require 'sinatra/assetpack'
require 'sinatra/settings'
require 'sinatra/logger'
require 'sinatra/js'
require 'redcarpet'
require 'rerun'
require 'sinatra/cookies'
require 'sinatra/flash'
#require 'rack/csrf' # TODO: resolver esto, es importante tener un csrf por motivos de seguridad en los formularios.
#require 'sinatra/handlebars'

require_relative 'libs/redmine.rb'
require_relative 'libs/issues.rb'
require_relative 'helpers/init'

class SmartRedmine < Sinatra::Base
  helpers Sinatra::CleanHash
  helpers Sinatra::Ahah
  helpers Sinatra::ChangeDate
  helpers Sinatra::Cookies
  helpers Sinatra::CsrfTag
  helpers Sinatra::CsrfToken
  helpers Sinatra::IssueNotes
  helpers Sinatra::MarkdownHelper

  ROOT = File.dirname(__FILE__)

  configure do
    set :ROOT, File.dirname(__FILE__)
    set :bind, '0.0.0.0'
    enable :sessions
    register Sinatra::Flash
    set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]
    enable :method_override

      #register Sinatra::Handlebars
      #handlebars {
      #  templates '/js/templates.js',['app/view/handlebars/*']
      #}

      register Sinatra::AssetPack
      assets do
        serve '/images', :from => 'asset/img/'
        serve '/js', :from => 'asset/js'
        js :application, [
          '/js/jquery.js',
          '/js/foundation.min.js',
          '/js/easyredmine.js',
          '/js/vendor/pickadate/lib/compressed/legacy.js',
        ]

        serve '/css', :from => 'asset/css'
        css :application, [
          '/css/*.css',
          '/css/vendor/pickadate/*.css'
        ]
      end

  end

  before do
    @config = ENV['Redmine_uri'] || "development"
    YAML.load_file("conf/config.yaml")[@config]
  end

  def require_logged_in
    redirect('login') if is_not_authenticated?
  end

  def is_not_authenticated?
    return session[:user].nil?
  end


end
require_relative 'routes/init'
