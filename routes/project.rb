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

    path = @config['config']['url'] + 'issues.json?project_id=' + params[:id] + '&key=' + session[:user]['api_key']
    response = RedmineIssues.new.get_issues path

    if response && response['total_count'] == 0

      @sin_incidencias = response['total_count']
      erb :'../views/issues'
    end


    if response
      @issues = response['issues']
    end

    pathmembers = @config['config']['url'] + 'projects/' + params[:id] + '/memberships.json'
    responsemembers = RedmineIssues.new.get_project_users pathmembers,session
    if !responsemembers.nil?
      @members = responsemembers['memberships'].inject({}) {|sum, elem| sum[elem['user']['id']] = elem['user']['name']; sum}
    end

    pathpriorities = @config['config']['url'] + 'enumerations/issue_priorities.json'
    responsepriorities = RedmineIssues.new.get_issue_priorities pathpriorities, session
    if responsepriorities
      @priorities =  cleanhash ( responsepriorities['issue_priorities'])
    end

    pathtracker = @config['config']['url']  + 'projects/' + params[:id] + '.json?include=trackers'
    responsetrackers = RedmineIssues.new.get_issue_data pathtracker, session
    if responsetrackers
      @trackers = cleanhash ( responsetrackers['project']['trackers'])
    end

    pathstatus = @config['config']['url'] + 'issue_statuses.json'
    responsestatus = RedmineIssues.new.get_issue_status pathstatus, session
    if responsestatus
      @status = cleanhash ( responsestatus['issue_statuses'])
    end

    pathversions = @config['config']['url'] + 'projects/' + params[:id] + '/versions.json'
    responseversions = RedmineIssues.new.get_project_versions pathversions, session

    if responseversions
      @versions = cleanhash (responseversions)
    end


    @path = @config['config']['url']
    @project_id = params[:id]

    erb :'../views/issues'

  end

end
