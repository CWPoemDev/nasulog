# == Schema Information
#
# Table name: poems
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  title            :string(255)
#  description      :text(65535)
#  show             :boolean
#  original_poem_id :integer
#  image            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Poem < ApplicationRecord
  belongs_to :user
  belongs_to :original_poem, class_name: 'Poem', required: false
  has_many :repoems, class_name: :Poem, foreign_key: :original_poem_id
  has_many :read_poems, dependent: :destroy

  delegate :icon_url, to: :user
  delegate :name, to: :user, prefix: :author

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  mount_uploader :image, ImageUploader

  def quote_original_poem
    if original_poem
      self.title = "RP: #{original_poem.title}"
      self.description =
        original_poem.description.gsub(/^/, '> ').gsub(/\A/, "\r\n\r\n\r\n")
    end
  end

  def previous
    Poem.where("created_at < ?", self.created_at).order("id DESC").first
  end

  def next
    Poem.where("created_at > ?", self.created_at).order("id ASC").first
  end
end
