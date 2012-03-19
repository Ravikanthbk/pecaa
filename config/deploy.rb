set :application, "Pecaa"
set :repository,  "git@github.com:rajeshv/pecaa.git"
set :scm, :git
set :user, "jmunta"
set :database, "mysql"
set :deploy_to, "/home/jmunta/pecaa_web_app"
set :domain, "50.97.78.218"
set :branch, "master"
set :runner, user
set :admin_runner, user
set :use_sudo,false
set :keep_releases, 3

ssh_options[:forward_agent] = true

set :scm_verbose, true
set :deploy_via, :remote_cache

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
role :app, domain                          # This may be the same as your `Web` server
role :web, domain                          # Your HTTP server, Apache/etc
role :db,  domain, :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do 

task :start do ; end
task :stop do ; end
task :restart, :roles => :app, :except => { :no_release => true } do
  run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
end

desc "Create all symlinks "
  task :create_symlinks, :roles => :app do
    run "ln -nsf #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    run "ln -nsf #{shared_path}/system #{current_path}/public/system"
    run "ln -nsf #{shared_path}/system #{current_path}/public/system"
    run "ln -nsf #{shared_path}/config/production.rb #{current_path}/config/environments/production.rb"
end

  desc "Database Backup "
  task :db_backup do
    filename = "#{shared_path}/back_up#{Time.now.strftime('%m-%d-%Y-%T')}.sql"
    text = capture "cat #{deploy_to}/current/config/database.yml"
    yaml = YAML::load(text)
    run "mysqldump -u #{yaml['production']['username']} -p  #{yaml['production']['database']} > #{shared_path}/mysql_dump/#{yaml['production']['database']}_#{Time.now.strftime('%m-%d-%Y-%T').gsub(':','-')}.sql" do |ch, _, out| 
      if out =~ /^Enter password: /
        ch.send_data "\n"
      else
        puts out 
      end
    end

  end

  desc "Seed Data into Database"
  task :db_seed do
    run  "cd #{current_path} && rake db:seed RAILS_ENV=production"
  end
  
  desc "Restart Nginx"
  task :nginx_restart do
    # run "/etc/init.d/nginx stop"
    run "/etc/init.d/nginx restart"
  end

  desc "Restarting Apache"
  task :apache_restart do
    run "/usr/sbin/httpd -k stop"
    run "/usr/sbin/httpd -k start"
  end
  

end

after 'deploy:symlink', 'deploy:create_symlinks'
# after 'deploy:start', 'deploy:apache_restart'
# after 'deploy:db_backup', 'deploy:db_seed'
# after 'deploy:db_backup', 'deploy:migrate'
# after 'deploy:create_symlinks', 'deploy:db_backup'

