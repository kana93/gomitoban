class User < ActiveRecord::Base
  has_many :histories
end
