# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require "capistrano/rails/migrations"
# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or


# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rvm"
# require "capistrano/rbenv"
# require "capistrano/chruby"
# require "capistrano/bundler"
# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
# require "capistrano/passenger"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
# Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }


# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Include capistrano-rails
require 'capistrano/rails'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/puma'
require 'capistrano/puma/nginx'

module RemoteCacheWithProjectRootStrategy
  def test
    test! " [ -f #{repo_path}/HEAD ] "
  end

  def check
    test! :git, :'ls-remote', repo_url
  end

  def clone
    git :clone, '--mirror', repo_url, repo_path
  end

  def update
    git :remote, :update
  end

  #copied from https://github.com/capistrano/capistrano/blob/master/lib/capistrano/git.rb
  def fetch_revision
    context.capture(:git, "rev-parse --short #{fetch(:branch)}")
  end

  #archive and strip out the subfolder
  def release
    git :archive, fetch(:branch), fetch(:project_root), '| tar -x -C', release_path, "--strip=#{fetch(:project_root).count('/')+1}"
  end
end