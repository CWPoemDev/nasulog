class PoemCreationService
  class << self
    def create(user, parameters, view_context: nil)
      new.create(user, parameters, view_context: view_context)
    end
  end

  def create(user, parameters, view_context: nil)
    poem = user.poems.build(parameters)
    if poem.save
      post_notification(poem, view_context)
    end
    poem
  end

  private

  def post_notification(poem, view_context)
    return unless view_context

    message = notification_message_for(poem, view_context)
    SlackNotificationService.post(message)
  end

  def notification_message_for(poem, view_context)
    (<<-END).strip_heredoc
      ------------------------
      新しいポエムが投稿されました

      ▼Title
      #{poem.title}

      ▼本文
      #{poem.description.gsub(/(\r\n|\r|\n|\f)/, '').truncate(120)}

      ▼URL
      #{view_context.poem_url(poem)}
      ▼Author
      #{poem.user.name}
    END
  end
end
