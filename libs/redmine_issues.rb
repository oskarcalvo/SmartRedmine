# encoding: utf-8
class RedmineIssues


  def get_issues (path)

    response = RedmineConnect2API.new.connect(path)

    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end

  def get_project_users(path, session)

    response = RedmineConnect2API.new.connect(path, {user: session[:loginname], pass: session[:loginpass] })

    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end


  def get_issue_priorities(path, session)

    response = RedmineConnect2API.new.connect(path, {user: session[:loginname], pass: session[:loginpass]})
    #binding.pry
    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end

  def get_issue_data(path, session)

    response = RedmineConnect2API.new.connect(path, {user: session[:loginname], pass: session[:loginpass]})
    #binding.pry
    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end

  def get_issue_status(path, session)

    response = RedmineConnect2API.new.connect(path, {user: session[:loginname], pass: session[:loginpass]})
    #binding.pry
    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end

  def put_issue(path, args = {})

    response = RedmineConnect2API.new.put(path, args)

    case response
    when  Net::HTTPSuccess then
      return true
    else
      return nil
    end

  end


end
