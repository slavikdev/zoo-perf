require 'rubygems'
require 'sinatra'

require_relative '../db'


get '/time' do
  "time= #{Time.now}"
end

get '/write' do
  dummy = Dummy.last
  if dummy.nil?
    dummy = Dummy.new
  end

  dummy.time = Time.now
  dummy.save!

  'Dummy created'
end

get '/read' do
  dummies = Dummy.all
  text = ''
  dummies.each do |dummy|
    text << "#{dummy.time}\n"
  end

  text
end

N = 1_000
get '/pull' do
  max = ( params[ :id ] || N ).to_i
  max.times {
    dummy = Dummy.new
    dummy.time = Time.now
    dummy.save!
  }

  "#{max} items pulled"
end

get '/delete_all' do
  count = Dummy.count
  Dummy.delete_all
  "#{count} items deleted"
end