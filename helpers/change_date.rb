require 'sinatra/base'

module Sinatra
  module ChangeDate
    def change_date(date)
      if date == nil
        return nil
      end
      Date.parse(date).strftime("%d-%m-%Y")
    end
  end
  helpers ChangeDate
end
