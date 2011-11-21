require 'rubygems'

module Zoo
  DATABASE = 'ruby_zoo_test'
  MONGO = ENV.has_key? 'USE_MONGO'
end

require_relative( Zoo::MONGO ? 'mongo' : 'mysql' )