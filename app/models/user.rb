# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text(65535)
#  google_uid :text(65535)
#  image_url  :text(65535)
#  email      :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :poem, dependent: :destroy
end
