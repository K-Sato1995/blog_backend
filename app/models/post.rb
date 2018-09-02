class Post < ApplicationRecord
  enum status: { draft: 0, published: 1, confidential: 2 }
  validates :title, :context, presence: true
end
