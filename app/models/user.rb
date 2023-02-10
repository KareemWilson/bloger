class User < ApplicationRecord
  attr_accessor :email_confirmation

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :email, confirmation: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_3_posts
    posts.order(created_at: :DESC).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end

end
