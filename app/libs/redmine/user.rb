module Redmine
  class User
    USEROBJECT = 'users/current.json'
    USERPROJECTS = 'users/current.json?include=memberships'

    def get_user (user, pass)
      path =  USEROBJECT

      response = Redmine::Connect2API.get(path, {user: user, pass: pass })

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
      path = USERPROJECTS + '&key=' + apikey

      response = Redmine::Connect2API.get(path)

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
end
