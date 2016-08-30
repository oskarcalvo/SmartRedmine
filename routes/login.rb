class SmartRedmine < Sinatra::Base
  get '/login' do
    erb :'../views/loginform'
  end


  post '/loginvalidate' do

    response = RedmineUser.new.get_user(params[:name],params[:password])
    #Si response no devuelve el objeto del usuario de redmine volvemos a la página de login

    if !response.nil?


      #guardamos los datos de user/pass y objeto de usuario de redmine en la sesión de sinatra
      session[:loginname] = params[:name]
      session[:loginpass] = params[:password]
      session[:user] = response['user']

      if cookies['project_id']
        redirect '/project/' + cookies[:project_id]
      end

      redirect '/user'
    else
      redirect '/login'
    end
    ##binding.pry
  end

end
