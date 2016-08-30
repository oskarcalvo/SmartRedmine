# encoding: utf-8
class SmartRedmine < Sinatra::Base

  get '/issues/:id' do


  end

  put '/issues/:id' do

    params.delete("_method")
    params.delete("captures")
    params.delete("splat")
    params.delete("actualizar")
    #binding.pry
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
    #binding.pry

    redirect '/project/' + params[:project_id]
  end




end
