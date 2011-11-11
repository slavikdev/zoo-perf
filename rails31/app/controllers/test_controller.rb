class TestController < ApplicationController
  def time
    @time = Time.now
    render :text => "time= #{@time}"
  end

  def write
    dummy = Dummy.last
    if dummy.nil?
      dummy = Dummy.new
    end

    dummy.time = Time.now
    dummy.save!

    render :text => 'Dummy created'
  end

  def read
    @dummies = Dummy.all

    text = ''
    @dummies.each do |dummy|
      text << "#{dummy.time}\n"
    end

    render :text => text
  end

  N = 1_000
  def pull
    max = ( params[ :id ] || N ).to_i
    max.times { create_dummy }
    render :text => "#{max} items pulled"
  end


  def delete_all
    count = Dummy.count
    Dummy.delete_all
    render :text => "#{count} items deleted"
  end

private
  def create_dummy
    dummy = Dummy.new
    dummy.time = Time.now
    dummy.save!
  end
end
