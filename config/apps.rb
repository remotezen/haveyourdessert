##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount('blog').to('/blog')
#   Padrino.mount('blog', :app_class => 'BlogApp').to('/blog')
#   Padrino.mount('blog', :app_file =>  'path/to/blog/app.rb').to('/blog')
#
# You can also map apps to a specified host:
#
#Padrino.mount('Admin').host('admin.localhost')
#   Padrino.mount('WebSite').host(/.*\.?example.org/)
#   Padrino.mount('Foo').to('/foo').host('bar.example.org')
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount('AppName', :app_file => 'path/to/file', :app_class => 'BlogApp').to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, 'c827fcdc4617ee707e4a4a6c4dca158c5e220878f6712817b3bde06d441e7d0f'
  set :protection, :except => :path_traversal
  set :protect_from_csrf, true
end

# Mounts the core application for this project

Padrino.mount("Blog::Admin", :app_file => Padrino.root('admin/app.rb')).to("/admin")
Padrino.mount('Blog::App', :app_file => Padrino.root('app/app.rb')).to('/')
read_and_write_cache_store = ActiveSupport::Cache.lookup_store :dalli_store, 'localhost:11211'
write_only_cache_store = ActiveSupport::Cache.lookup_store :dalli_store, 'localhost:21211'
set :cache, DoubleWriteCacheStores::Client.new(read_and_write_cache_store, write_only_cache_store)
