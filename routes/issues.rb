# encoding: utf-8
class SmartRedmine < Sinatra::Base


  get '/issues/:id/journals' do

    require_logged_in
    #path = @config['config']['url'] + 'issues/' + params[:id] + '.json?include=journals&key=' + session[:user]['api_key']
    #response = RedmineIssues.new.get_issues path
    content_type :json
    journals = Issue.new( params[:id],session[:user]['api_key'] ).get_journals

  end

  put '/issues/:id' do

    require_logged_in

    params.delete("_method")
    params.delete("captures")
    params.delete("splat")
    params.delete("actualizar")

    path = @config['config']['url'] + 'issues/' + params[:id] + '.json'
    args = {
      issue:  params,
      user: session[:loginname],
      pass: session[:loginpass],
    }

    response = RedmineIssues.new.put_issue(path, args)

    if response
      flash[:message_issue_updated] = "Issue #{params[:subjetc]} has been updated."
    else
      flash[:message_issue_updated] = "Something go wrong with #{params[:subjetc]}, please contact with the administrator of the website."
    end

    redirect '/projects/' + params[:project_id]
  end

  post '/issues/new' do
    require_logged_in
    # puts params
    #{"project_id"=>"9", "tracker_id"=>"3", "status_id"=>"1", "priority_id"=>"1", "assigned_to_id"=>"6", "estimated_hours"=>"5.33", "subject"=>"dfdsfsafsdafda", "description"=>"fdsafsafsafdsadffds", "actualizar"=>"Actualizar"}

    path = @config['config']['url'] + 'issues.json'
    args = {
      issue: params,
      user: session[:loginname],
      pass: session[:loginpass],
    }

    response = RedmineIssues.new.post_issue(path,args)

  end


end
