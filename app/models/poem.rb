# == Schema Information
#
# Table name: poems
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :text(65535)
#  description :text(65535)
#  show        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Poem < ActiveRecord::Base
  belongs_to :user
  has_many :favorite
end
