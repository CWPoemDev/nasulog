namespace :read_poem_mail do
  desc "Aggregating read poem mark and send mail."

  task :send => :environment do |task, args|
    read_poems = ReadPoem.joins(:poem).joins(:user).where(created_at: 1.day.ago.all_day)
    poems = Poem.where(id: read_poems.pluck(:poem_id))
    users = User.where(id: poems.pluck(:user_id))

    users.each do |user|
      ReadPoemMailer.read_poem(user, poems).deliver
    end
  end
end
