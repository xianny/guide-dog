require 'factory_girl'
require 'faker'
require 'pry'

FactoryGirl.define do 
  factory :user do
    username { Faker::Internet.user_name }
    password 'asdf' ##{ Faker::Internet.password }'
    email  { Faker::Internet.safe_email }
    avatar { Faker::Avatar.image }
  end
end

tags = ['food', 'music', 'sports', 'shopping', 'lazy', 'adventurous', 'getting_smashed', 'beach', 'ski', 'park']


## START CREATION
##


# # Creates 10 new tags
tags.each { |name| Tag.create(name: name) }
tags = Tag.all
# # Creates 30 new users
20.times do
  FactoryGirl::create(:user)
end

user = User.first
user.username = 'test'
user.save

users = User.all
# Each user posts 2 activities and adds 3 tags to it
users.each do |user|
  2.times do 
    activity = Activity.create(
      user_id: user.id,
      title: "#{Faker::Commerce.product_name}",
      location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
      cost: rand(3),
      content: "Try doing this stuff. #{Faker::Lorem.paragraph}. Much fun. So wow!"
    )
    activity.save
    tags.sample(3).each do |tag|
      activity.tags << tag 
    end
    activity.save
  end
end

# Each user reviews 5 random activities that they did not author
users.each do |user|
  activities = Activity.where("user_id != ?", user.id).sample(2)
  activities.each do |a|
    review = a.reviews.create(
        comment: "This is what I think of this activity!! #{Faker::Lorem.paragraph} MUCH WOW! would do again.",
        rating: rand(5) + 1,
        user_id: user.id
      )
    review.save if review.valid?
  end
end


