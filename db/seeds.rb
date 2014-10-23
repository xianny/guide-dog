require 'factory_girl'
require 'faker'

FactoryGirl.define do 
  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    email  { Faker::Internet.safe_email }
    avatar { Faker::Avatar.image }
  end
end


# FactoryGirl.define do
#   factory :tag do
#     name Faker::Lorem.word
#   end
# end

# 200.times do 
#   FactoryGirl.create(:tag)
# end

# FactoryGirl.define do
#   factory :activity do
#     title { Faker::Lorem.sentence }
#     # at_home boolean
#     # social boolean
#     cost { "#{rand(4)}" }
#     location "#{Faker::Address.city} #{Faker::Address.state_abbr}"
#     content { Faker::Lorem.paragraph }
#   end
# end


# FactoryGirl.define do
#   factory :review do
#     comment { Faker::Lorem.paragraph }
#     rating { "#{rand(5) + 1}" }
#     activity
#   end
# end

## START CREATION
##

# Creates 30 new users
30.times do
  FactoryGirl::create(:user)
end

# Creates 10 new tags
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')
Tag.create(name:'')

users = User.all

## Each user posts 2 activities and adds 3 tags to it
users.each do |user|
  tags = Tag.all
  2.times do 
    activity = user.activities.create(
      title: "#{Faker::Lorem.sentence}",
      location: "#{Faker::Address.city} #{Faker::Address.state_abbr}",
      cost: rand(4)
    )
    3.times { activity.tags << tags[rand(tags.count)] }
    end
    activity.save if activity.valid?
  end
end

## Each user reviews 5 random activities that they did not author
users.each do |user|
  activities = Activity.where("user_id != ?", user.id)
  
  5.times do
    activity = activities[rand(activities.count)]
    review = activity.reviews.create(
        comment: "#{Faker::Lorem.paragraph}",
        rating: rand(5) + 1,
        user_id: user.id
      )
    review.save if review.valid?
  end
end

# users.each do |user|
#   users.reviews.each do |review|
#     review.rating += 1
#   end
# end

