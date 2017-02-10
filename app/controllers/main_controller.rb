# encoding: utf-8
class SmartRedmine < Sinatra::Base
  get '/' do
    redirect '/login'
  end

  get '/db' do
#     db_connection = Sequel.connect('sqlite://test.db')
#     first_item  = db_connection[:configuration].first
# content_type  :json
# first_item.to_json
  end

end
