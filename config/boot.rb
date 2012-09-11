# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

# Dragonfly initialization

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  dragonfly = Dragonfly[:attachments]
  dragonfly.configure_with(:imagemagick) do |c|
    c.url_format = '/media/:job'
  end
  if Padrino.env == :production
    dragonfly.configure do |c|
      Dragonfly::DataStorage::S3DataStore.new(
        :bucket_name => ENV['S3_BUCKET'],
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      )
    end
  else
    dragonfly.datastore.configure do |c|
      c.root_path = "#{PADRINO_ROOT}/public/media"
      c.server_root = "#{PADRINO_ROOT}/public"
    end
  end
  dragonfly.define_macro(ActiveRecord::Base, :attachment_accessor)
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do

end

Padrino.load!
