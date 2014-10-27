class User < ActiveRecord::Base
  has_many :activities
  has_many :proficiencies, dependent: :destroy
  has_many :reviews
  has_many :tags, through: :proficiencies
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :email, confirmation: true, if: "email"
  after_initialize :set_default_avatar
  ## TODO validate and set default :avatar

  def total_influence
    total = 0
    num = 0
    activities.each do |activity|
      if activity.rating.kind_of?(Numeric)
        total+= activity.rating 
        num += 1
      end
    end
    ((total/num) + activities.count).to_i
  end


  def set_default_avatar
    self.avatar = "/img/doge.jpeg" if avatar.nil?
  end

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