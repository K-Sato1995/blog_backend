class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum status: { draft: 0, published: 1, confidential: 2 }
  validates :title, :context, :category, presence: true

  scope :draft, -> { where(status: 'draft') }
  scope :confidential, -> { where(status: 'confidential') }
  scope :published, -> { where(status: 'published') }

  def self.search(title)
    if title
      where('title LIKE ?', "%#{title}%")
    else
      all
    end
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name: nil
  end

  def self.category_search(category)
    where('category_id LIKE ?', "%#{category.to_s}%")
  end
end
