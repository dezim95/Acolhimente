class ForumThread < ApplicationRecord
  belongs_to :user
  has_many :forum_posts, dependent: :destroy

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true
  validates_associated :forum_posts
end
