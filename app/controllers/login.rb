class SmartRedmine < Sinatra::Base
  get '/login' do
    erb :'loginform'
  end

  get '/loginvalidate' do
      if !response.nil?
        redirect '/login'
      end
  end

  post '/loginvalidate' do

    response = Redmine::User.new.get_user(params[:name],params[:password])

    if !response.nil?
      #guardamos los datos de user/pass y objeto de usuario de redmine en la sesión de sinatra
      session[:loginname] = params[:name]
      session[:loginpass] = params[:password]
      session[:user] = response['user']

      if cookies['project_id']
        redirect '/projects/' + cookies[:project_id]
      end
      redirect '/user'
    else
      redirect '/login'
    end
  end

end
