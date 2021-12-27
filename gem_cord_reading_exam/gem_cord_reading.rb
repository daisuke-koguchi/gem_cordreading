require 'dotenv'
require "slack-notify"
require 'clockwork'
require 'active_support/time'
Dotenv.load
module Clockwork
  every(3.minutes,'3.minutes.job') do 
    sample = SlackNotify::Client.new(webhook_url: ENV["URL"])
    sample.notify("3分毎にslackにメッセージが遅れたら成功")
  end
end