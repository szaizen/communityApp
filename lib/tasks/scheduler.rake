require "slack"
namespace :scheduler do
  desc "メッセージ実行"

  # 幹事決定
  task :send_message => :environment do
    # if Time.now.day == 1
      user = User.order("RANDOM()").limit(1).first
      user_profile = user.profile ||= nil
      if user_profile.present?
        Slack.chat_postMessage(text: "#{Time.now.month}月度飲み会の幹事は#{user_profile.name}さんです!", username: "飲み会マスター", channel: "#test")
      end
    # end
  end

  # 好きな食べ物
  task :send_food => :environment do
    # if Time.now.day == 1
      user = User.order("RANDOM()").limit(1).first
      user_profile = user.profile ||= nil
      if user_profile.present?
        Slack.chat_postMessage(text: "#{user_profile.name}の 大好物は#{user_profile.food}!", username: user_profile.name, channel: "#test")
      end
    # end
  end

  # 飲み会開催場所
  task :send_station => :environment do
    Slack.chat_postMessage(text: "今回の開催場所は#{ENV["STATION"].split(",").sample}に決定！", username: "飲み会マスター", channel: "#test")
  end
end