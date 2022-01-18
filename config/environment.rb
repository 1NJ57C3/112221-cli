# Env.rb file sets our local environment

# Require everything from the gemfile on everything
require "bundler/setup"
Bundler.require

# Connect AR to the database
ActiveRecord::Base.establish_connection(
  # what type of sql is this database
  adapter: "sqlite3", # postgres, mysql, sqlite2
  # either access, or create db
  database: "db/development.sqlite"
)

# Shows raw SQL queries to user
ActiveRecord::Base.logger = Logger.new(STDOUT)

# require_all takes a folder as an arg
require_all "app"
