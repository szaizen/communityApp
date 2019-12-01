require "slack"
namespace :scheduler do
  desc "メッセージ実行"

  # 幹事決定
  task :send_message => :environment do
    if Time.now.day == 1
      Slack.chat_postMessage(text: "#{Time.now.month}月度飲み会の幹事は#{random_user.name}さんです!", username: "飲み会マスター", channel: ENV["CHANNEL"])
    end
  end

  # 好きな食べ物
  task :send_food => :environment do
    if Time.now.day == 1
      target = random_user
      Slack.chat_postMessage(text: "#{target.name}の 大好物は#{target.food}!", username: target.name, channel: ENV["CHANNEL"])
    end
  end

  # 飲み会開催場所
  task :send_station => :environment do
    if Time.now.day == 1
      Slack.chat_postMessage(text: "今回の開催場所は、#{ENV["STATION"].split(",").sample}に決定！", username: "飲み会マスター", channel: ENV["CHANNEL"])
    end
  end

  private

  def random_user
    Profile.where.not(name: nil, food: nil).order("RANDOM()").limit(1).first
  end
end