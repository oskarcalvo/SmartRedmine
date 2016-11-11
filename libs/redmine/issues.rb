# encoding: utf-8
module Redmine
  class Issues
    class << self
      def get_issues (path)
        response = Redmine::Connect2API.get(path)

        case response
        when  Net::HTTPSuccess then
          data = JSON.parse(response.body)
          return data
        else
          return nil
        end

      end

      def get_project_users(path, session)

        response = Redmine::Connect2API.get(path, {user: session[:loginname], pass: session[:loginpass] })

        case response
        when  Net::HTTPSuccess then
          data = JSON.parse(response.body)
          return data
        else
          return nil
        end

      end


      def get_issue_priorities(path, session)

        response = Redmine::Connect2API.get(path, {user: session[:loginname], pass: session[:loginpass]})
        case response
        when  Net::HTTPSuccess then
          data = JSON.parse(response.body)
          return data
        else
          return nil
        end

      end

      def get_issue_data(path, session)

        response = Redmine::Connect2API.get(path, {user: session[:loginname], pass: session[:loginpass]})
        case response
        when  Net::HTTPSuccess then
          data = JSON.parse(response.body)
          return data
        else
          return nil
        end

      end

      def get_issue_status(path, session)

        response = Redmine::Connect2API.get(path, {user: session[:loginname], pass: session[:loginpass]})
        case response
        when  Net::HTTPSuccess then
          data = JSON.parse(response.body)
          return data
        else
          return nil
        end

      end

      def get_project_versions(path, session)

        response = Redmine::Connect2API.get(path, {user: session[:loginname], pass: session[:loginpass]})

        case response
        when  Net::HTTPSuccess then
          data = JSON.parse(response.body)
          return   data['total_count'].to_i == 0 ? nil : data
        else
          return nil
        end

      end


      def put_issue(path, args = {})

        response = Redmine::Connect2API.put(path, args)

        case response
        when  Net::HTTPSuccess then
          return true
        else
          return nil
        end

      end

      def post_issue(path, args = {})
        response = Redmine::Connect2API.post(path, args)

        case response
        when  Net::HTTPSuccess then
          return true
        else
          return nil
        end
      end
    end
  end
end
