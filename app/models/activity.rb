require_relative '../../config/environment'

class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :relevances
  has_many :reviews
  has_many :tags, through: :relevances

  before_validation :set_defaults, on: :create


  validates :user_id, presence: true
  validates :title, presence: true
  validates :at_home, inclusion: {in: [true, false]}
  validates :social, inclusion: {in: [true, false]}
  validates :cost, presence: true, inclusion: {in: [0,1,2,3]}  ## must be input by user, no defaults
  validates :location, presence: true 

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
    puts "ACTIVITY TAGS #{tags.inspect}"
    puts "REVIEWER TAGS #{reviewer.tags.inspect}"
    combined_tags = []
    combined_tags.concat(tags)
    combined_tags.concat(reviewer.tags)
    puts "COMBINED: #{combined_tags.inspect}"

    # duplicate_tags =  combined_tags.select do |tag| 
    #                     combined_tags.count(tag) > 1
    #                   end
    # duplicate_tags.uniq!
  end


  def save_rating_by(reviewer, rating)
    common_tags = find_common_tags(reviewer)
  end


end

activity = Activity.find(25)
reviewer = User.find(20)
binding.pry
