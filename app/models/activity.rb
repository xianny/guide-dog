

class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :relevances
  has_many :reviews
  has_many :tags, through: :relevances

  before_validation :set_defaults, on: :create

  # TODO after_save :update_author_tags


  validates :user_id, presence: true
  validates :title, presence: true
  validates :at_home, inclusion: {in: [true, false]}
  validates :social, inclusion: {in: [true, false]}
  validates :cost, presence: true, inclusion: {in: [0,1,2,3]}  ## must be input by user, no defaults
  validates :location, presence: true 

  def update_author_tags
    new_tags = unique_tags
    new_tags.each do |tag|
      user.tags << tag
    end
  end

  def unique_tags(user=self.user)
    result = Set.new(self.tags) ^ Set.new(user.tags)
    result.to_a
  end


  def set_defaults
    self.at_home = true if self.at_home.nil?
    self.social = false if self.social.nil?
  end

  # returns aggregated rating
  def rating
    total = 0
    reviews.each do |review|
      total += review.rating
    end
    total
  end

  #returns String = filepath, to image representing cost e.g. "/img/dollarsign1.jpg"
  def cost_img
    case self.cost
    when 0 then "/img/cost-0.jpg"
    when 1 then "/img/cost-1.jpg"
    when 2 then "/img/cost-2.jpg"
    when 3 then "/img/cost-3.jpg"
    end
  end

  def find_common_tags(reviewer)
    result = Set.new(tags & reviewer.tags)
    result.to_a
  end

  # Variables: reviewer = User object, rating = (Integer)
  # Triggers relevance update for all tags in common with User
  def save_rating_by(reviewer, rating)
    common_tags = find_common_tags(reviewer)
    common_tags.each do |tag|
      relevance = relevances.where(tag_id: tag.id).first

      relevance.modify_strength(rating, reviewer.proficiency(tag))

      user.save_rating(tag, reviewer, rating)
    end
  end

end
