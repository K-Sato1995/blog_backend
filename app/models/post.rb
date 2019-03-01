class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  enum status: { draft: 0, published: 1, confidential: 2 }
  enum language: { english: 0, japanese: 1, others: 2 }

  validates :title, :context, :category_name, presence: true
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

  def self.status_check(params)
    if params[:status] == 'draft'
      draft
    elsif params[:status] == 'confidential'
      confidential
    else
      published
    end
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    category ? category.name : nil
  end

  def tag_list
    tags.map(&:name).join(',')
  end
end
