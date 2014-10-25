class Review < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validates_associated :user, :activity

  validate :rating_or_comment_exists
  validates :user_id, presence: true
  validates :activity_id, presence: true

  def rating_or_comment_exists
    if !(self.rating || self.comment)
      errors.add(:rating, 'Must have either rating or comment')
      errors.add(:comment, 'Must have either rating or comment')
    end
  end


end