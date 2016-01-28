class ReadPoemMailer < ApplicationMailer
  def read_poem(users, poems)

    users.each do |user|
      @user = user
      @poems = poems.where(user_id: user.id)

      mail to: user.email, subject: "#{Date.yesterday}についた読んだよマークの一覧"
    end
  end
end
