require 'rbconfig'

if RbConfig::CONFIG[ 'host_os' ] =~ /mswin|mingw/
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S app.rb -p 9287 -e production start'
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S app.rb -p 9288 -e production start'
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S app.rb -p 9289 -e production start'
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S app.rb -p 9290 -e production start'
else
  `ruby -S app.rb -p 9287 -e production -d`
  `ruby -S app.rb -p 9288 -e production -d`
  `ruby -S app.rb -p 9289 -e production -d`
  `ruby -S app.rb -p 9290 -e production -d`
end