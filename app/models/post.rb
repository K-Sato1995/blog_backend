class Post < ApplicationRecord
  extend FriendlyId
  belongs_to :author
  belongs_to :category
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  friendly_id :title, use: [:slugged, :finders]

  enum status: { draft: 0, published: 1, confidential: 2 }
  enum language: { english: 0, japanese: 1, others: 2 }

  validates :title, :content, :category_name, presence: true
  validates_inclusion_of :score, in: 1..10

  scope :draft, -> { where(status: 'draft') }
  scope :confidential, -> { where(status: 'confidential') }
  scope :published, -> { where(status: 'published') }

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
