class User < ActiveRecord::Base
  has_many :activities
  has_many :proficiencies
  has_many :tags, through: :proficiencies
  
  validates :username, presence: true
  validates :password, presence: true
  ## TODO validate and set default :avatar
end