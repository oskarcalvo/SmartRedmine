# encoding: utf-8
class Issues

  def initialize()
    @config = YAML.load_file("./conf/config.yaml")
  end

end
