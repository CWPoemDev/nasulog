# == Schema Information
#
# Table name: one_time_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  token      :string(128)
#  expires_at :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_one_time_tokens_on_token    (token)
#  index_one_time_tokens_on_user_id  (user_id)
#

class OneTimeToken < ApplicationRecord
  belongs_to :user
  before_validation :set_token, :set_expires_at

  scope :valid, -> {
    where('expires_at > ?', Time.current)
  }

  private

  def set_token
    self.token ||= SecureRandom.hex(64)
  end

  def set_expires_at
    self.expires_at ||= (Time.current + 5.minutes)
  end
end
