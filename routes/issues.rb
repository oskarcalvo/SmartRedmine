# encoding: utf-8
class SmartRedmine < Sinatra::Base


  get '/issues/:id' do


    require_logged_in
    path = @config['config']['url'] + 'issues/' + params[:id] + '.json?include=journals&key=' + session[:user]['api_key']
    response = RedmineIssues.new.get_issues path
    binding.pry

    erb "<pre>#{response.issue}</pre>"
  end

  put '/issues/:id' do

    require_logged_in

    params.delete("_method")
    params.delete("captures")
    params.delete("splat")
    params.delete("actualizar")
    #params["start_date"] = params["start_date_submit"]
    #params.delete("start_date_submit")
    #params["due_date"] = params["due_date_submit"]
    #params.delete("due_date_submit")
    binding.pry

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

    redirect '/project/' + params[:project_id]
  end




end
