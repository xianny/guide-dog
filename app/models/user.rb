class User < ActiveRecord::Base
  has_many :activities
  has_many :proficiencies
  has_many :reviews
  has_many :tags, through: :proficiencies
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :email, confirmation: true, if: "email"
  ## TODO validate and set default :avatar


  # Variables: tag = Tag
  # Returns total proficiency associated with the tag as Float
  def proficiency(tag)
    proficiency = proficiencies.where(tag_id: tag.id).first
    proficiency.strength 
  end

  # Variables: tag = Tag, reviewer = User, rating = Integer
  # modifies proficiency for Tag based on reviewer's expertise and the given rating
  def save_rating(tag, reviewer, rating)
    proficiency = proficiencies.where(tag_id: tag.id).first
    user_factor = reviewer.proficiency(tag)

    proficiency.modify_strength(rating, user_factor)
  end

end