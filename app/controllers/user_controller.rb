# encoding: utf-8
class SmartRedmine < Sinatra::Base

  get '/user' do
    #validamos si el usuario se ha autentificado correctamente.
    require_logged_in

    if cookies['project_id']
      redirect '/projects/' + cookies[:project_id]
    end

    response = Redmine::User.get_projects(session[:user]['api_key'])
    if !response.nil?
      @projectlist = response
    else
      redirect '/login'
    end

    erb  :'user'
  end
end
