# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  google_uid :text(65535)
#  image_url  :text(65535)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :poem, dependent: :destroy

  def self.form_omniauth(auth)
    User.create(
      google_uid: auth[:uid],
      name: auth[:info][:name],
      email: auth[:info][:email],
      image_url: auth[:info][:image]
    )
  end
end
