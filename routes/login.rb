class SmartRedmine < Sinatra::Base
  get '/login' do
    erb :'../views/loginform'
  end
end
