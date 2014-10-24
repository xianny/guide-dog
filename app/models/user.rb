class User < ActiveRecord::Base
  has_many :activities
  has_many :proficiencies
  has_many :reviews
  has_many :tags, through: :proficiencies
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :email, confirmation: true, if: "email"
  ## TODO validate and set default :avatar
end