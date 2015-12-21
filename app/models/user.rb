class User < ActiveRecord::Base
  has_many :poem, dependent: :destroy
end
