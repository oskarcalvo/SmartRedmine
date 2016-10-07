# encoding: utf-8
class Issue

  attr_reader :issue_id
  attr_reader :key

  def initialize (issue_id, key)
    @config = YAML.load_file("./conf/config.yaml")
    @issue_id = issue_id
    @key = key
end

  def get_issue
    return get_issue_data
  end

  def get_journals
    journals = clean_journals(get_issue_data)
    return journals
  end

  private
  def clean_journals (journals)

    notes = {}
    journals['issue']['journals'].each do | journal |

      unless journal['notes'].empty? && journal['id']

        note = Markdown.new(journal['notes']).to_html

        notes[journal['id']] = {
          id: journal['id'],
          name: journal['user']['name'],
          notes: note,
          created_on: journal['created_on']
        }
      end
    end

    return notes.to_json
  end

  def get_issue_data
    path = @config['config']['url'] + 'issues/' + issue_id + '.json?include=journals&key=' + key
    response = RedmineIssues.new.get_issues path
  end


end
