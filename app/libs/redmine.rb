Dir[File.dirname(__FILE__) + '/redmine/*.rb'].each do |file|
    require file
end
