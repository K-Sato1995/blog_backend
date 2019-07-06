class Comment < ApplicationRecord
  belongs_to :post, optional: true
  enum status: { unpublished: 0, published: 1 }

  validates :name, :content, presence: true

  scope :unpublished, -> { where(status: 'unpublished') }
  scope :published, -> { where(status: 'published') }
end
