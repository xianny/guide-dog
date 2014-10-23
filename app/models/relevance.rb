class Relevance < ActiveRecord::Base
  belongs_to :activity
  belongs_to :tag

  before_validation :set_default_strength, on: :create
  validates :strength, presence: true
  validates :activity_id, presence: true
  validates :tag_id, presence: true

  def set_default_strength
    self.strength ||=0
  end

end