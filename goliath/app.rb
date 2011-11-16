require 'rubygems'
require 'goliath'
require 'mongo'
gem 'bson_ext'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new( 'localhost', 27017 )
MongoMapper.database = 'sinatra-test'

class Dummy
  include MongoMapper::Document
  key :time, Time
end


class RackRoutes < Goliath::API
  use Goliath::Rack::Params

  get '/time' do
    run proc { [200, {}, "time= #{Time.now}"] }
  end

  get '/write' do
    dummy = Dummy.last
    if dummy.nil?
      dummy = Dummy.new
    end

    dummy.time = Time.now
    dummy.save!

    run proc { [200, {}, 'Dummy created'] }
  end

  get '/read' do
    dummies = Dummy.all
    text = ''
    dummies.each do |dummy|
      text << "#{dummy.time}\n"
    end

    run proc { [200, {}, text] }
  end

  N = 1_000
  get '/pull' do
    max = ( params[ :id ] || N ).to_i
    max.times {
      dummy = Dummy.new
      dummy.time = Time.now
      dummy.save!
    }

    run proc { [200, {}, "#{max} items pulled"] }
  end

  get '/delete_all' do
    count = Dummy.count
    Dummy.delete_all

    run proc { [200, {}, "#{count} items deleted"] }
  end
end