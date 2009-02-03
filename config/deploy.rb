set :application, "learningrails"
set :deploy_to, "/var/www/sheridanwest/apps/#{application}"

role :app, "sheridanwest.com"
role :web, "sheridanwest.com"
role :db,  "sheridanwest.com", :primary => true

default_run_options[:pty] = true
set :repository,  "git://github.com/sjwest/learning-rails-sample-app.git"
# git@github.com:sjwest/learning-rails-sample-app.git"
set :scm, "git"
set :branch, 'master'
set :deploy_via, :remote_cache

set :user, "root"
set :admin_runner, "root"

# set :use_sudo, 'false'

set :scm_verbose,  'true'
set :rake, '/usr/local/bin/rake'

namespace :deploy do
  
  desc "environment.db change permission"
  #task :after_setup [:web] do
  #run "cd /var/www/sheridanwest/apps/learningrails/current/config"
  run "/bin/chown www-data /var/www/sheridanwest/apps/learningrails/current/config/environment.db"
  #end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  # desc "Start Application -- not needed for Passenger"
  # task :start, :roles => :app do
  #  # nothing -- need to override default cap start task when using Passenger
  # end

  
  
  
end