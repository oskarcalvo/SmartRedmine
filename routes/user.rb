class SmartRedmine < Sinatra::Base

  get '/user' do
    #validamos si el usuario se ha autentificado correctamente.
    require_logged_in
    # binding.pry
    if is_not_authenticated?
      redirect('login')
      return
    end


    response = RedmineUser.new.getprojects(session[:user]['api_key'])

    if !response.nil?
      @projects = response
    else
      redirect '/login'
    end

    erb  :'../views/user'

  end

end
