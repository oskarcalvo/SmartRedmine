require 'sinatra/base'

module Sinatra
  module IssueNotes
    def issue_notes(notes)
      newhash = Hash.new
        notes.each do | note |
          if !note.empty?
          end
        end


    end
  end
  helpers IssueNotes
end
