# == Schema Information
#
# Table name: poems
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  show        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

class Poem < ActiveRecord::Base
  belongs_to :user, required: true

  delegate :icon_url, to: :user
  delegate :name, to: :user, prefix: :author

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  before_destroy :mark_as_deleted
  default_scope -> { where(deleted_at:nil) }

  def destroy
    mark_as_deleted
  end

  private

  def mark_as_deleted
    self.update_attribute(:deleted_at ,Time.current.to_time)
  end
end
