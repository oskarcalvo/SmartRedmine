class SmartRedmine < Sinatra::Base

  post '/configuration/safe_settings' do

    params.delete("guardar")
    values = params.to_json
    email = session['user']['mail']
    redmineUserToken = session['user']['api_key']


    Model::Configuration.insert(:email => email, :redmineUserToken => redmineUserToken , :settings => values)
    binding.pry
  end


end
