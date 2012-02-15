set :application, "PECAA_Spree_Store"
set :repository,  "git@git.assembla.com:pecaa_spree_store.git"
set :user, "root"
set :deploy_to, "/home/rubys/work/bsi"
#set :deploy_via, :remote_cache
set :branch, "master"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "184.106.167.25"                          # Your HTTP server, Apache/etc
role :app, "184.106.167.25"                          # This may be the same as your `Web` server
#role :db,  "db01.shelfx.com", :primary => true # This is where Rails migrations will run


namespace :deploy do
   task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


