# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  google_uid :text(65535)
#  icon_url   :text(65535)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :read_poems, dependent: :destroy
  has_many :poems, dependent: :destroy
  has_one :one_time_token, dependent: :destroy

  def my_poem?(poem)
    self == poem.user
  end

  def my_read_poem?(read_poem)
    self == read_poem.user
  end

  def create_one_time_token
    OneTimeToken.delete_all(user_id:id)
    one_time_token = OneTimeToken.create(user_id: id)
  end

  def self.form_omniauth(auth)
    User.create(
      google_uid: auth[:uid],
      name: auth[:info][:name],
      email: auth[:info][:email],
      icon_url: auth[:info][:image]
    )
  end
end
