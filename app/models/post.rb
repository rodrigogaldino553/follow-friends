class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :comments, dependent: :destroy

  scope :approved_posts, -> { where(:approved => true) }
  scope :unapproved_posts, -> { where(:approved => false) }
  scope :user_posts, -> (user){ where(:user_id => user) }
end
