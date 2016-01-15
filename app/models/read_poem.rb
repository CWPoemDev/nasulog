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
# Indexes
#
#  index_read_poems_on_poem_id  (poem_id)
#  index_read_poems_on_user_id  (user_id)
#

class ReadPoem < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :poem, required: true
end
