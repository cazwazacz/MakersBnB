require './app/app'

namespace :db do
  desc 'Non-destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    p 'Your database has been upgraded'
  end
  desc 'Destructive migration'
  task :auto_migrate do
    DataMapper.auto_migrate!
    p 'Your database has been migrated; all data has been lost'
  end
end
