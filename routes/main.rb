# encoding: utf-8
class SmartRedmine < Sinatra::Base
  get '/' do
    redirect '/login'
  end

end
