class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum status: { draft: 0, published: 1, confidential: 2 }
  validates :title, :context, :category, presence: true
  validates_inclusion_of :score, in: 1..10

  scope :draft, -> { where(status: 'draft') }
  scope :confidential, -> { where(status: 'confidential') }
  scope :published, -> { where(status: 'published') }

  def self.search(title: '', category: '')
    if title
      where('title LIKE ?', "%#{title}%")
    elsif category
      where(category_id: category.to_i)
    else
      all
    end
  end

  def self.status_check(status: '')
    if status == 'draft'
      draft.order('title ASC')
    elsif status == 'confidential'
      confidential.order('title ASC')
    else
      published.order('title ASC')
    end
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    category ? category.name : nil
  end
end
