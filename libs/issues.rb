# encoding: utf-8
class Issue

  attr_reader :issue_id

  def initialize issue_id
    @config = YAML.load_file("./conf/config.yaml")
    @issue_id = issue_id
  end

  def issue 
    path = @config['config']['url'] + 'issues/' + issue_id + '.json?include=journals&key=' + session[:user]['api_key']
    response = RedmineIssues.new.get_issues path
  end

  def journals
    issue['issues']['journals']

  end

end
