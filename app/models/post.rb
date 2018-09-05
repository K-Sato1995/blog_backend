class Post < ApplicationRecord
  belongs_to :user
  enum status: { draft: 0, published: 1, confidential: 2 }
  validates :title, :context, :category, presence: true

  def self.search(title)
    if title
      where('title LIKE ?', "%#{title}%")
    else
      all
    end
  end
end
