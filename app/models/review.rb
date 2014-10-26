
class Review < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user


  validate :rating_or_comment_exists
  # before_save :cannot_rate_self
  validates :user_id, presence: true
  validates :activity_id, presence: true

  # after_save :update_activity ## how to make this so it distinguishes between new ratings and updated ratings?

  def rating_or_comment_exists
    if !(self.rating || self.comment.length > 0 )
      errors.add(:base, 'Must have either rating or comment')
    end
  end

  def cannot_rate_self
    rating = nil if activity.user_id == user.id
  end

  def update_activity
    activity.save_rating_by(user,rating) if rating 
  end

end


