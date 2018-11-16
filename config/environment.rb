require 'bundler'
Bundler.require

# ActiveRecord::Base.logger.level = 1

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
