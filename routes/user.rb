class SmartRedmine < Sinatra::Base

  get '/user' do
    #validamos si el usuario se ha autentificado correctamente.
    require_logged_in

    if cookies['project_id']
      redirect '/projects/' + cookies[:project_id]
    end

    response = RedmineUser.new.get_projects(session[:user]['api_key'])

    if !response.nil?
      @projects = response
    else
      redirect '/login'
    end

    erb  :'../views/user'

  end

end
