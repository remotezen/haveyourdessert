# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{haveyourdessert}
role :web, %w{haveyourdessert.com}
role :db,  %w{haveyourdessert}


#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
server 'haveyourdessert.com -p 54321',
   user: 'deploy',
   roles: %w{web app},
   ssh_options: {
     user: 'deploy', # overrides user setting above
     keys: %w(/home/deploy/.ssh/id_rsa),
     forward_agent: false,
     auth_methods: %w(publickey password),
      password: %w(vgn-fs550)
   }
