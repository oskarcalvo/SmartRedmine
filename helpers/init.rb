require_relative 'cleanhash.rb'
helpers Sinatra::CleanHash

require_relative 'ahah.rb'
helpers Sinatra::Ahah

require_relative 'change_date.rb'
helpers Sinatra::ChangeDate

require_relative 'rack_csrf.rb'
helpers Sinatra::CsrfTag
helpers Sinatra::CsrfToken
