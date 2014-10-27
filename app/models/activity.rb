# require_relative '../../config/environment'
require 'faker'

class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :relevances, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tags, through: :relevances


  before_validation :set_defaults, on: :create

  after_save :update_author_tags, on: :update


  validates :user_id, presence: true
  validates :title, presence: true
  validates :at_home, inclusion: {in: [true, false]}
  validates :social, inclusion: {in: [true, false]}
  validates :cost, presence: true, inclusion: {in: [0,1,2,3]}  ## must be input by user, no defaults
  validates :location, presence: true 

  def update_author_tags
    unique_tags.each do |tag|
      user.tags << tag
    end
    user.save
  end

  def unique_tags(user=self.user)
    user_tags = user.tags
    result = Set.new(self.tags) - user_tags
    result.to_a
  end


  def set_defaults
    self.at_home = true if self.at_home.nil?
    self.social = false if self.social.nil?
  end

  # returns aggregated rating
  def rating
    total = 0.0
    num = 0
    reviews.each do |review|
      if review.rating
        total += review.rating
        num += 1
      end
    return "None" if num == 0
    (total/num).round(1)
  end

  #returns String = filepath, to image representing cost e.g. "/img/cost-0.jpg" for free activity
  def cost_img
    "/img/cost-#{self.cost}.png"
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
