# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/cron.log'
set :environment, @environment
#環境変数の指定
job_type :runner, "PATH=$PATH:/usr/local/bin && cd :path && bundle exec bin/rails runner -e :environment ':task' :output"

#ごみの日当日18時に通知
# crontab型の設定「分」「時」「日」「月」「曜日」
every '00 18 * * 1,2,4' do
  runner "Tasks::Chatworknote.notify"
end
#当番のリセット
every '00 00 * * 1,2,4' do
  runner "TobanController.new.create_every"
end
