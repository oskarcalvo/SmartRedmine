# encoding: utf-8
class SmartRedmine < Sinatra::Base
  get '/project/:id' do
    #binding.pry
    #validamos si el usuario se ha autentificado correctamente.
    require_logged_in
  
    #binding.pry
    path = @config['config']['url'] + 'issues.json?project_id=' + params[:id] + '&key=' + session[:user]['api_key']
    response = RedmineIssues.new.getissues path

    if response && response['total_count'] == 0
    
      @sin_incidencias = response['total_count']
      erb :'../views/issues'
    end

    
    if response 
      @issues = response['issues']
      
    end
    
    pathmembers = @config['config']['url'] + 'projects/' + params[:id] + '/memberships.json'
    responsemembers = RedmineIssues.new.getprojectusers pathmembers,session
    if !responsemembers.nil?
      @members = responsemembers['memberships'].inject({}) {|sum, elem| sum[elem['user']['id']] = elem['user']['name']; sum}
    end
  
    pathpriorities = @config['config']['url'] + 'enumerations/issue_priorities.json'
    responsepriorities = RedmineIssues.new.getissuepriorities pathpriorities, session
    if responsepriorities
      @priorities =  cleanhash ( responsepriorities['issue_priorities'])
    end
  
    pathtracker = @config['config']['url']  + 'projects/' + params[:id] + '.json?include=trackers'
    responsetrackers = RedmineIssues.new.getissuedata pathtracker, session
    if responsetrackers
      @trackers = cleanhash ( responsetrackers['project']['trackers'])
    end

    pathstatus = @config['config']['url'] + '/issue_statuses.json'
    responsestatus = RedmineIssues.new.getissuestatus pathstatus, session
    if responsestatus
      @status = cleanhash ( responsestatus['issue_statuses'])
    end
  
    #Pasamos la variable con la url de redmine.
    @path = @config['config']['url']
    
    #binding.pry
    
    erb :'../views/issues'
    
  end

end
