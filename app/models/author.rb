class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  attr_accessor :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  class << self
    # Return the hash value of the given string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Return a random token
    def generate_token
      SecureRandom.urlsafe_base64
    end
  end

  # Create a new token -> encrypt it -> stores the hash value in remember_digest in DB.
  def remember
    self.remember_token = Author.generate_token
    update_attribute(:remember_digest, Author.digest(remember_token))
  end

  # Check if the given value matches the one stored in DB
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
