class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  scope :approved_posts, -> { where(:approved => true) }
  scope :unapproved_posts, -> { where(:approved => false) }
end
