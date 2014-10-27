class Proficiency < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag

  before_validation :set_default_strength, on: :create
  validates :strength, presence: true
  validates :user_id, presence: true
  validates :tag_id, presence: true

  PROFICIENCY_MODIFIER = 0.3

  def set_default_strength
    self.strength ||=0
  end

  def modify_strength(rating, user_factor)
    self.strength += (rating * (user_factor + PROFICIENCY_MODIFIER))
  end
end