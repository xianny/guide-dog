require 'sinatra/activerecord'
require 'active_support/all'

class Review < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user


  validate :rating_or_comment_exists
  validate :cannot_review_self
  validates :user_id, presence: true
  validates :activity_id, presence: true

  def rating_or_comment_exists
    if !(self.rating || self.comment)
      errors.add(:rating, 'Must have either rating or comment')
      errors.add(:comment, 'Must have either rating or comment')
    end
  end

  def cannot_review_self
    errors.add(:user_id, 'Cannot review activity posted by self') if activity.user_id == user.id
  end

  def test_save
    activity.save_rating_by(user,rating) if rating
  end

end
