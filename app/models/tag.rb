class Tag < ActiveRecord::Base
  has_many :relevances, dependent: :destroy
  has_many :activities, through: :relevances
  has_many :proficiencies, dependent: :destroy
  has_many :users, through: :proficiencies

  validates :name, presence: true, uniqueness: true

end