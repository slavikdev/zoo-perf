require 'rbconfig'

if RbConfig::CONFIG[ 'host_os' ] =~ /mswin|mingw/
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9087 -e production start'
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9088 -e production start'
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9089 -e production start'
  spawn 'cmd /K C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9090 -e production start'
else
  `thin -p 9087 -e production -s 4 -d start`
end