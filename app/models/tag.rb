class Tag < ActiveRecord::Base
  has_many :relevances
  has_many :activities, through: :relevances
  has_many :proficiencies
  has_many :users, through: :proficiencies

  validates :name, presence: true, uniqueness: true

end