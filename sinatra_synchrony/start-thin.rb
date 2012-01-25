require 'rbconfig'

if RbConfig::CONFIG[ 'host_os' ] =~ /mswin|mingw/
  spawn 'C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9187 -e production start'
  spawn 'C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9188 -e production start'
  spawn 'C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9189 -e production start'
  spawn 'C:\\ruby19\\bin\\ruby.exe -S C:\\ruby19\\bin\\thin -p 9190 -e production start'
else
  `thin -p 9187 -e production -s 4 -d start`
end