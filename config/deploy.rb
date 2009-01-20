set :application, "learningrails"
set :deploy_to, "/var/www/sheridanwest/apps/#{application}"

role :app, "mail2.sheridanwest.com"
role :web, "mail2.sheridanwest.com"
role :db,  "127.0.0.1", :primary => true

default_run_options[:pty] = true
set :repository,  "git://github.com/sjwest/learning-rails-sample-app.git"
 # "git://github.com/mzslater/learning-rails-sample-app.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "root"
set :admin_runner, "root"

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "Start Application -- not needed for Passenger"
  task :start, :roles => :app do
    # nothing -- need to override default cap start task when using Passenger
  end
end