class RedmineUser
  USEROBJECT = 'users/current.json'
  USERPROJECTS = 'users/current.json?include=memberships'

  def initialize()
    @config = YAML.load_file( SmartRedmine::ROOT + "/conf/config.yaml")
    
  end

  def get_user (user, pass)
    path = @config["config"]["url"] + USEROBJECT

    response = RedmineConnect2API.new.connect(path, {user: user, pass: pass })

    #data = nil

    case response
      when  Net::HTTPSuccess then
        data = JSON.parse(response.body)
        return data
      else
      return nil
    end

  end

  def get_projects (apikey)
    path = @config['config']['url'] + USERPROJECTS + '&key=' + apikey

    response = RedmineConnect2API.new.connect(path)

    #projects = nil

    case response
    when  Net::HTTPSuccess then
      data = JSON.parse(response.body)
      projects = data['user']['memberships']
      return projects
    else
      return nil
    end

  end

end
