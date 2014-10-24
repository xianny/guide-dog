class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :relevances
  has_many :reviews
  has_many :tags, through: :relevances

  before_validation :set_defaults, on: :create
  validates_associated :user

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

  end

end