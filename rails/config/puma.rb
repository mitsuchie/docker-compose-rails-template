thread_count = ENV['RAILS_MAX_THREADS'] || 5
threads thread_count, thread_count
port        ENV['PORT'] || 3000
environment ENV['RAILS_ENV'] || 'development'
plugin :tmp_restart

# app_root = File.expand_path("#{File.dirname(__FILE__)}/..")
app_root = File.expand_path(File.dirname(__FILE__) + '/..')
bind "unix:///#{app_root}/tmp/sockets/puma.sock"
