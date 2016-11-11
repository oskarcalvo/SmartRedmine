# encoding: utf-8
class SmartRedmine < Sinatra::Base
  get '/projects/:id' do
    #validamos si el usuario se ha autentificado correctamente.
    require_logged_in

    if cookies[:project_id] != params[:id]
       cookies[:project_id] = params[:id]
    end


    if flash[:message_issue_updated]
      @message = flash[:message_issue_updated]
    end

    path = 'issues.json?project_id=' + params[:id] + '&key=' + session[:user]['api_key']
    response = Redmine::Issues.get_issues path

    if response && response['total_count'] == 0

      @sin_incidencias = response['total_count']
      erb :'../views/issues'
    end


    if response
      @issues = response['issues']
    end

    pathmembers = 'projects/' + params[:id] + '/memberships.json'
    responsemembers = Redmine::Issues.get_project_users pathmembers,session
    if !responsemembers.nil?
      @members = responsemembers['memberships'].inject({}) {|sum, elem| sum[elem['user']['id']] = elem['user']['name']; sum}
    end

    pathpriorities = 'enumerations/issue_priorities.json'
    responsepriorities = Redmine::Issues.get_issue_priorities pathpriorities, session
    if responsepriorities
      @priorities =  cleanhash ( responsepriorities['issue_priorities'])
    end

    pathtracker = 'projects/' + params[:id] + '.json?include=trackers'
    responsetrackers = Redmine::Issues.get_issue_data pathtracker, session
    if responsetrackers
      @trackers = cleanhash ( responsetrackers['project']['trackers'])
    end

    pathstatus = 'issue_statuses.json'
    responsestatus = Redmine::Issues.get_issue_status pathstatus, session
    if responsestatus
      @status = cleanhash ( responsestatus['issue_statuses'])
    end

    pathversions = 'projects/' + params[:id] + '/versions.json'
    responseversions = Redmine::Issues.get_project_versions pathversions, session

    if responseversions
      @versions = cleanhash (responseversions)
    end

    projectlist = Redmine::User.get_projects(session[:user]['api_key'])

    if projectlist
      @projectlist = projectlist
    end


    @path = Redmine::Connect2API.redmine_uri
    @project_id = params[:id]

    erb :'../views/issues'
  end
end
