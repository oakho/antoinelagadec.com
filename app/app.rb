class Portfolio < Padrino::Application
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  use Dragonfly::Middleware, :attachments

  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  register Sinatra::AssetPack

  enable :sessions
  ##
  # Caching support
  #
  # register Padrino::Cache
  # enable :caching
  #
  # You can customize caching store engines:
  #
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
  #   set :cache, Padrino::Cache::Store::Memory.new(50)
  #   set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
  #

  ##
  # Application configuration options
  #
  # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
  # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
  # set :public_folder, "foo/bar" # Location for static assets (default root/public)
  # set :reload, false            # Reload application files (default in development)
  # set :default_builder, "foo"   # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"       # Set path for I18n translations (default your_app/locales)
  # disable :sessions             # Disabled sessions by default (enable if needed)
  # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
  # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  set :site_title_base, "Antoine Lagadec"
  set :site_title_separator, "|"

  set :soundcloud, Soundcloud.new(client_id:     ENV['SC_ID'],
                                  client_secret: ENV['SC_SECRET'],
                                  username:      ENV['SC_USERNAME'],
                                  password:      ENV['SC_PASSWORD'])

  assets do
    serve '/js',     from: '../public/assets/js'
    serve '/css',    from: '../public/assets/css'
    serve '/img',    from: '../public/assets/img'

    # TODO: Patch AssetPack to let fonts be served
    serve '/fonts',  from: '../public/assets/fonts'

    css :screen, ['/css/screen.css']
    css :print, ['/css/print.css']

    js :require, ['/js/libs/require.js']
  end

  helpers do

  end

  before do

  end

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  configure :development do
    set :reload, true
  end

  configure :production do
  end

  get "/" do
    render 'pages/about'
  end

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  #   error 505 do
  #     render 'errors/505'
  #   end
  #
end
