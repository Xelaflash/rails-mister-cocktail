# frozen_string_literal: true

# Usage:
#
# # dump the development db
# rake db:dump
#
# # dump the db in a specific format
# rake db:dump format=sql
#
# # dump a table (e.g. users table)
# rake db:dump:table table=users
#
# # dump a table in a specific format
# rake db:dump:table table=users format=sql
#
# # list dumps
# rake db:dumps
#
# # dump the production db
# RAILS_ENV=production rake db:dump
#
# # restore db based on a backup file pattern (e.g. timestamp)
# rake db:restore pattern=20170101
#
# # note: config/database.yml is used for database configuration,
# #       but you will be prompted for the database user's password
#
namespace :db do
  desc 'Dump the database to db/<time>._<name>.pgsql_dump'
  task dump: :environment do
    cmd = nil
    f_name = nil
    with_config do |_app, host, db, user, pass|
      f_name = "#{Rails.root}/db/#{Time.now.strftime('%Y%m%d%H%M%S')}_#{db}.psql_dump"
      cmd = "PGPASSWORD='#{pass}' pg_dump -F c -v -h '#{host}' -U '#{user}' -f '#{f_name}' #{db}"
    end
    puts "Backing up to #{f_name} ..."
    puts cmd
    exec cmd
  end

  desc 'Restore the database dump; NOTE: The current database will be dropped!'
  task :restore, [:date] => :environment do |_task, args|
    cmd = nil
    f_name = nil
    date = args.date
    with_config do |_app, host, db, user, pass|
      unless date.present?
        warn 'ERROR: Please choose a date from the available backup files:'
        system("set -o pipefail && ls -1 #{Rails.root}/db/*_#{db}.psql_dump | sed -E 's/.+\\/([0-9]+)_.+/  \\1/'") ||
          fail_with_msg("Failed to list files. Check in #{Rails.root}/db/ for your available dumps")
        print 'Date: '
        date = STDIN.gets.strip
      end
      f_name = "#{Rails.root}/db/#{date}_#{db}.psql_dump"
      cmd = "PGPASSWORD='#{pass}' pg_restore -F c -v -h '#{host}' -U '#{user}' -d #{db} -c -C #{f_name}"
    end
    puts 'Dropping the current database first...'
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    puts "Restoring database from #{f_name} ..."
    puts cmd
    exec cmd
  end

  private

  def with_config
    yield Rails.application.class.parent_name.underscore,
      ActiveRecord::Base.connection_config[:host],
      ActiveRecord::Base.connection_config[:database],
      ActiveRecord::Base.connection_config[:username],
      ActiveRecord::Base.connection_config[:password]
  end

  def fail_with_msg(msg, code = 1)
    warn('ERROR: ' + msg)
    exit code
  end
end
