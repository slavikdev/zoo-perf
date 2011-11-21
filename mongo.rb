puts 'Using Mongo'

require 'rubygems'
require 'mongo'
gem 'bson_ext'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new( 'localhost', 27017 )
MongoMapper.database = Zoo::DATABASE

class Dummy
  include MongoMapper::Document
  key :time, Time
end