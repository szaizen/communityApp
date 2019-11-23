namespace :scheduler do
  desc "メッセージ実行"
  task :send_message => :environment do
    require "slack"
    if Time.now.day == 1
      user = User.order("RANDOM()").limit(1).first
      user_profile = user.profile ||= nil
      if user_profile.present?
        Slack.chat_postMessage(text: "#{Time.now.month}度飲み会の幹事は#{user_profile.name}さんです!", username: user_profile.name, channel: "#test")
      end
    end
  end

  task :send_ => :environment do
    if Time.now.day == 1
      require "slack"
      user = User.order("RANDOM()").limit(1).first
      user_profile = user.profile ||= nil
      if user_profile.present?
        Slack.chat_postMessage(text: "#{user_profile.name}の 大好物は#{user_profile.food}!", username: user_profile.name, channel: "#test")
      end
    end
  end
end