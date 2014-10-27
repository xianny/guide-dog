class Relevance < ActiveRecord::Base
  belongs_to :activity
  belongs_to :tag

  before_validation :set_default_strength, on: :create
  validates :strength, presence: true
  validates :activity_id, presence: true
  validates :tag_id, presence: true

  RELEVANCE_MODIFIER = 0.5

  def set_default_strength
    self.strength ? return : self.strength = 0 
  end

  def modify_strength(rating, user_factor)
    self.strength += (rating * (user_factor + RELEVANCE_MODIFIER))
  end

end