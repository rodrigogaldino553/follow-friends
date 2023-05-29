class Post < ApplicationRecord
  belongs_to :user

  scope :approved_posts, -> { where(:approved => true) }
  scope :unapproved_posts, -> { where(:approved => false) }
end
