class Comment < ApplicationRecord
  belongs_to :post
  enum status: { draft: 0, published: 1 }
end
