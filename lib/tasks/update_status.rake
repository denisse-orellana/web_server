# bundle exec rake environment tasks:update_status 
# rake tasks:update_status 
# heroku rake tasks:update_status 

namespace :tasks do
  desc "Sync with some source"
  task :update_status => :environment do
    puts "There are x number of servers to update"
    Server.update_server_statuses
    puts "done."
  end
end
