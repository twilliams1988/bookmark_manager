require 'data_mapper'
require './app.rb'

namespace :db do
  desc "Non desctructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto_upgrade complete (no data loss)"
  end

  desc "Desctructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto_migrate complete (data was lost)"
  end
end
