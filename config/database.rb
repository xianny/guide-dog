configure do
  # Log queries to STDOUT and use local SQLite3 db in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)

    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }

  else

  # Use Heroku Postgresql db otherwise
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      encoding: 'unicode',
      pool: 5,
      database: 'dbrsihccp8r3mu',
      username: ' ltalqvxufvnmyh',
      password: 'P8Z5R_B-JseojLo5vn4Q_NEVCu',
      host: 'ec2-174-129-21-42.compute-1.amazonaws.com',
      port: 5432,
      min_messages: 'error'
    )
    puts "Connection established"
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end


end
