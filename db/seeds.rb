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


## START CREATION
##

# Creates 30 new users
30.times do
  FactoryGirl::create(:user)
end

# Creates 10 new tags
Tag.create(name:'food')
Tag.create(name:'music')
Tag.create(name:'sports')
Tag.create(name:'shopping')
Tag.create(name:'lazy')
Tag.create(name:'adventurous')
Tag.create(name:'getting_smashed')
Tag.create(name:'beach')
Tag.create(name:'ski')
Tag.create(name:'park')
@tags = Tag.all

users = User.all

## Each user posts 2 activities and adds 3 tags to it
users.each do |user|
  2.times do 
    activity = user.activities.create(
      title: "Some Cool Activity Title",
      location: "#{Faker::Address.city} #{Faker::Address.state_abbr}",
      cost: rand(4),
      content: "Try doing this stuff. And then this other stuff! #{Faker::Lorem.paragraph}"
    )
    activity.save if activity.valid?
    3.times { activity.tags << @tags.sample }
  end
end

## Each user reviews 5 random activities that they did not author
users.each do |user|
  activities = Activity.where("user_id != ?", user.id).sample(5)
  activities.each do |a|
    review = a.reviews.create(
        comment: "This is what I think of this activity!! #{Faker::Lorem.paragraph}",
        rating: rand(5) + 1,
        user_id: user.id
      )
    review.save if review.valid?
  end
end

