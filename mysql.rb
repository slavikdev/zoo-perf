puts 'Using MySQL'

require 'data_mapper'

DataMapper.setup( :default, {
  :adapter  => 'mysql',
  :host     => 'localhost',
  :username => 'root',
  :password => '123',
  :database => Zoo::DATABASE
})


class Dummy
  include DataMapper::Resource

  property :id,   Serial    # An auto-increment integer key
  property :time, DateTime  # A DateTime, for any date you might like.

  def self.delete_all
    self.all.destroy
  end
end

DataMapper.auto_migrate!
DataMapper.finalize