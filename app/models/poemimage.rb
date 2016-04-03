# == Schema Information
#
# Table name: poemimages
#
#  id         :integer          not null, primary key
#  poem_id    :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poemimage < ApplicationRecord
  belongs_to :poem

  mount_uploader :image, ImageUploader
end
