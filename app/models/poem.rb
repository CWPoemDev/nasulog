# == Schema Information
#
# Table name: poems
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :text(65535)
#  show        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Poem < ActiveRecord::Base
  belongs_to :user, required: true

  delegate :icon_url, to: :user
  delegate :name, to: :user, prefix: :author

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  has_many :read_poems, dependent: :destroy

  def previous
    Poem.where("created_at < ?", self.created_at).order("id DESC").first
  end

  def next
    Poem.where("created_at > ?", self.created_at).order("id ASC").first
  end
end
