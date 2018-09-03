class Post < ApplicationRecord
  belongs_to :user
  enum status: { draft: 0, published: 1, confidential: 2 }
  validates :title, :context, :category, presence: true
end
