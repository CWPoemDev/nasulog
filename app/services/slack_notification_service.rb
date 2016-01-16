class SlackNotificationService
  class << self
    def post(message)
      new.post(message)
    end
  end

  def post(message)
    return unless slack_configured?

    Slack.chat_postMessage text: message, username: "PoemMaster", channel: slack_channel
  end

  private

  def slack_configured?
    slack_token && slack_channel
  end

  def slack_token
    ENV['SLACK_TOKEN']
  end

  def slack_channel
    ENV['SLACK_CHANNEL']
  end
end
