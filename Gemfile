source :rubygems

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'sass'
gem 'erubis', "~> 2.7.0"
gem 'activerecord', :require => "active_record"
gem 'sinatra-mustache'
gem 'dragonfly'
gem 'fog'
gem 'sinatra-assetpack'

# Test requirements
gem 'shoulda', :group => "test"
gem 'rack-test', :require => "rack/test", :group => "test"

# Padrino Stable Gem
gem 'padrino', '0.10.7'

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end

group :development, :test do
  gem 'sqlite3'
  gem 'thin'
end

group :production do
 gem 'pg'
 gem 'activerecord-postgresql-adapter'
end
