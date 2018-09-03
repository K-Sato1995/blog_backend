class User < ApplicationRecord
  has_many:posts, dependent: :destroy
  enum status: { admin: 0, subadmin: 1 }
end
