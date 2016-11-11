class SmartRedmine < Sinatra::Base

  get '/logout' do
    session.clear
    require_logged_in
  end

end
