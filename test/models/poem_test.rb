# == Schema Information
#
# Table name: poems
#
#  id          :integer          not null, primary key
#  users_id    :integer
#  title       :text(65535)
#  description :text(65535)
#  show        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PoemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
