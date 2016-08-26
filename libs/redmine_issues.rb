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
    #binding.pry


    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end


  def get_issue_priorities(path, session)

    uri = URI.parse(path)
    req = Net::HTTP::Get.new(uri)
    response = nil
    req.basic_auth session[:loginname], session[:loginpass]
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|   response = http.request(req)  }
    #binding.pry


    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end

  def getissuedata(path, session)

    uri = URI.parse(path)
    req = Net::HTTP::Get.new(uri)
    response = nil
    req.basic_auth session[:loginname], session[:loginpass]
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|   response = http.request(req)  }
    #binding.pry


    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end

  def get_issuestatus(path, session)

    uri = URI.parse(path)
    req = Net::HTTP::Get.new(uri)
    response = nil
    req.basic_auth session[:loginname], session[:loginpass]
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|   response = http.request(req)  }
    #binding.pry


    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      return data
    else
      return nil
    end

  end


end
