# == Schema Information
#
# Table name: read_poems
#
#  id         :integer          not null, primary key
#  poem_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReadPoem < ApplicationRecord
  belongs_to :user
  belongs_to :poem

  delegate :icon_url, to: :user
  delegate :name, to: :user, prefix: :user
end
