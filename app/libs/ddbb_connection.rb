# encoding: utf-8
class DDBBConnection
  class << self
    def connectString
      config = YAML.load_file( SmartRedmine::ROOT + "/app/conf/database.yml" )['development']
      string = "#{config['adapter']}://#{config['username']}:#{config['password']}@#{config['host']}/#{config['name']}"
    end
  end
end
