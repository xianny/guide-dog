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

tags = [
  'food', 
  'music', 
  'sports', 
  'shopping', 
  'lazy', 
  'adventurous', 
  'getting_smashed', 
  'beach', 
  'ski', 
  'park'
]

## 3 activities each for first ten users
activities = [
  {
    user_id: 1,
    title: "Create a Where clause",
    content: "The secret to making this a fun activity is beer. Lots of beer. In the fridge. Somewhere. Also, beer? There is sometimes... something... where something else is. Where clauses, yay.",
    location: "Lighthouse Labs",
    cost: 1 ,
    social: false,
    at_home: true
  },
  {
    user_id: 1,
    title: "Rspec",
    content: "RSpec is testing tool for the Ruby programming language. Born under the banner of Behaviour-Driven Development, it is designed to make Test-Driven Development a productive and enjoyable experience with features like:
              \na rich command line program (the rspec command)
              \ntextual descriptions of examples and groups (rspec-core)
              \nflexible and customizable reporting
              \nextensible expectation language (rspec-expectations)
              \nbuilt-in mocking/stubbing framework (rspec-mocks)",
    location: "Desk",
    cost: 0,
    social: true,
    at_home: true
  },
  {
    user_id: 1,
    title: "Foosball",
    content: "Table football, also known as table soccer, foosball (as in the German 'Fußball'), or kicker, is a table-top game and sport that is loosely based on association football. To begin the game, the ball is served through a hole at the side of the table, or simply placed by hand at the feet of a figure in the center of the table. The initial serving side is decided with a coin toss. Players attempt to use figures mounted on rotating bars to kick the ball into the opposing goal. Expert players have been known to move balls at speeds up to 56 km/h (35 mph) in competition.",
    location: "Lighthouse",
    cost: 0,
    social: true,
    at_home: false
  },
  {
    user_id: 2,
    title: "Canadian Wilderness Adventures",
    content: "Canadian Wilderness Adventures has been expertly guiding tours in Whistler, BC since 1993. Canadian operates year round on Blackcomb Mountain and in the beautiful Callaghan Valley. Choose from snowmobile, dogsled, snowshoe and the famous mountain top fondue at the Crystal Hut in winter, or ATV, Jeep 4x4, mtn top dining and canoe tours in the summer." ,
    location: "Whistler, BC",
    cost: 3,
    social: true,
    at_home: true
  },
  {
    user_id: 2,
    title: "White Water Rafting",
    content: "Known across Canada and the world as a must-see white water rafting destination, the friendly experts at Kumsheen, just three hours up the highway from Vancouver in Lytton BC, take pride in making your river rafting adventure smooth, fun, safe and professional.",
    location: "Lytton, BC",
    cost: 2,
    social: true,
    at_home: false
  },
  {
    user_id: 2,
    title: "Climbing Rocks",
    content: "There are some nice ones around here. They are big. And hard. With interesting striations. Climb them, try to bring some gear with you, it's rude to get blood all over the ground at the base of the cliff, because that's where everyone has their lunch and stuff.",
    location: "Squamish, BC",
    cost: 0,
    social: true,
    at_home: false
  },
  {
    user_id: 3,
    title: "Netflix",
    content: "Super social. watch in class, turn the volume up. Great for making new friends and losing old ones.",
    location: "Anywhere",
    cost: 0,
    social: true ,
    at_home: true
  },
  {
    user_id: 3,
    title: "Make a TV show",
    content: "You need a camera, a mic, a setting, some people, a bit of wildlife and a couple of acts of god. the old deus ex machina makes for a good pilot.",
    location: "your basement",
    cost: 3,
    social: true,
    at_home: false
  },
  {
    user_id: 3,
    title: "Watch a movie in a theatre",
    content: "The linguistic construction of post-capitalist hegemony may be parsed as the delegitimisation of The Man's aesthetic ideology.",
    location: "in a theatre",
    cost: 1,
    social: true,
    at_home: true
  },
  {
    user_id: 4,
    title: "Physics",
    content: "I tried some gravity the other day and it was pretty cool. I think it improved my digestion, too.",
    location: "Earthball",
    cost: 3,
    social: false,
    at_home: true
  },
  {
    user_id: 4,
    title: "Schrodinger's Cat",
    content: "A bit gamey, but pretty good with ketchup. Roast at 350F for 30mins/lb. Don't let Schrodinger know; I'm not sure he could withstand the ambiguity.",
    location: "Over there",
    cost: 2,
    social: true,
    at_home: true
  },
  {
    user_id: 4,
    title: "Hug a robot",
    content: "This is useful for when you feel a temptation to leave the house. It's always a good reminder that other beings are dangerous, liable to crush your mushy human bits with one poorly calculated gesture. Just stay home.",
    location: "Anywhere",
    cost: 0,
    social: false ,
    at_home: false 
  },
  {
    user_id: 5,
    title: "The Why of Fry",
    content: "Have you ever tried just turning off the TV, sitting down with your children, and hitting them? Kif might! Yes, except the Dave Matthews Band doesn't rock. Hello, little man. I will destroy you! Anyone who laughs is a communist!",
    location: "The Future",
    cost: 2,
    social: false ,
    at_home: true 
  },
  {
    user_id: 5,
    title: "PBR Money",
    content: "Keytar cred church-key gluten-free. Scenester keytar tilde organic mlkshk, banjo kitsch wolf High Life swag Banksy. Shabby chic pop-up whatever, +1 kitsch YOLO Echo Park roof party photo booth you probably haven't heard of them. Schlitz gentrify aesthetic, gluten-free disrupt polaroid hella heirloom Bushwick umami pork belly pug Brooklyn tote bag. Ugh PBR shabby chic, aesthetic post-ironic actually cold-pressed messenger bag quinoa meggings. Squid distillery selvage next level leggings XOXO Vice, typewriter disrupt chia. Sustainable organic McSweeney's kale chips, Truffaut mixtape Bushwick brunch actually before they sold out literally fixie fashion axe PBR crucifix.",
    location: "East Van",
    cost: 1,
    social: true ,
    at_home: false
  },
  {
    user_id: 5,
    title: "Quinoa Mash",
    content: "Tattooed leggings single-origin coffee Truffaut. Master cleanse trust fund Intelligentsia gluten-free meh readymade. Gastropub PBR lomo locavore wolf mlkshk kogi, occupy Bushwick quinoa ennui High Life Banksy. Selfies XOXO Brooklyn, distillery Intelligentsia kale chips leggings PBR brunch iPhone master cleanse. Chia Thundercats trust fund letterpress cardigan, beard farm-to-table next level ugh asymmetrical try-hard pork belly. Raw denim chillwave taxidermy quinoa Intelligentsia. Vinyl Cosby sweater quinoa raw denim artisan umami salvia.",
    location: "Portland, OR" ,
    cost: 1,
    social: true,
    at_home: true
  },
  {
    user_id: 6,
    title: "Shave someone else's beard",
    content: "Beard Kickstarter gastropub fingerstache hella selvage. Bushwick paleo Portland meggings seitan deep v trust fund. Tofu jean shorts semiotics, 8-bit small batch actually VHS mumblecore retro pork belly. Banksy forage lo-fi sriracha tote bag, cardigan Brooklyn Odd Future swag PBR&B vegan Thundercats. Shabby chic slow-carb paleo, Kickstarter Pinterest keytar flannel mixtape meditation pork belly chambray. Normcore paleo McSweeney's cliche before they sold out. Art party fashion axe post-ironic beard flexitarian.",
    location: "Cascadia",
    cost: 2,
    social: true,
    at_home: false
  },
  {
    user_id: 6,
    title: "You know you like it",
    content: "Banh mi photo booth Williamsburg meggings quinoa. Stumptown meggings Intelligentsia seitan selvage crucifix. Asymmetrical roof party ennui, meditation +1 pop-up Echo Park iPhone cardigan church-key. Salvia shabby chic letterpress, pickled craft beer yr forage slow-carb. XOXO fingerstache literally, Wes Anderson pork belly meh Truffaut umami Etsy try-hard irony taxidermy. Raw denim fap Pitchfork readymade viral, sustainable quinoa leggings wayfarers. Skateboard heirloom plaid, meh post-ironic letterpress cliche occupy Thundercats umami Helvetica selvage dreamcatcher banjo.",
    location: "Mall of America",
    cost: 1,
    social: true,
    at_home: false
  },
  {
    user_id: 6,
    title: "Herring",
    content: "Messenger bag Godard DIY vegan butcher, Marfa disrupt. Trust fund retro viral Pitchfork lomo, swag freegan sriracha Etsy cold-pressed messenger bag photo booth. Locavore literally kitsch, taxidermy Williamsburg Portland twee Austin. Asymmetrical mlkshk Cosby sweater, Thundercats Godard pickled chambray freegan fixie. Cliche leggings mustache, typewriter readymade Pinterest High Life locavore umami 3 wolf moon. Lomo cornhole butcher selfies, scenester umami Pitchfork aesthetic hella wolf. Artisan Kickstarter craft beer, tattooed direct trade YOLO you probably haven't heard of them vinyl slow-carb banh mi selvage Cosby sweater four loko cold-pressed mlkshk.",
    location: "Norway",
    cost: 2,
    social: true,
    at_home: false
  },
  {
    user_id: 7,
    title: "Learn a new language",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus nunc in ligula tempor dictum. Ut sed finibus massa. Cras semper at turpis vel aliquet. Nunc dictum at lacus ac vehicula. Ut posuere sit amet libero eu congue. Aliquam erat volutpat. Aliquam vitae posuere nunc. Phasellus suscipit felis dui, ut feugiat urna ornare ut.",
    location: "Internet",
    cost: 0,
    social: false ,
    at_home: true 
  },
  {
    user_id: 7,
    title: "Eat Croissants",
    content: "A croissant (/krəˈsɒnt/ or /ˈkrwʌsɒŋ/; French pronunciation: [kʁwa.sɑ̃] ( listen)) is a buttery, flaky, viennoiserie pastry named for its well-known crescent shape. Croissants and other viennoiserie are made of a layered yeast-leavened dough. The dough is layered with butter, rolled and folded several times in succession, then rolled into a sheet, in a technique called laminating. The process results in a layered, flaky texture, similar to a puff pastry.",
    location: "Paris",
    cost: 1,
    social: false,
    at_home: false
  },
  {
    user_id: 7,
    title: "Macrame",
    content: "Macramé or macrame is a form of textile-making using knotting rather than weaving or knitting. Its primary knots are the square knot and forms of 'hitching': full hitch and double half hitches. Great beginner activity for those interested in rope bondage.",
    location: "Anywhere",
    cost: 0,
    social: false,
    at_home: true
  },
  {
    user_id: 8,
    title: "Balls to the Wall",
    content: "Donec malesuada libero vel urna luctus pretium. Sed fringilla a lacus ac eleifend. In a fermentum justo. Duis ut augue eleifend, sollicitudin enim non, dapibus erat. Praesent aliquet feugiat quam, at ultricies neque accumsan a. Nulla facilisi. Donec tincidunt ullamcorper finibus. Vestibulum in eros scelerisque, tempor metus non, hendrerit justo. Nunc nisi erat, molestie vel accumsan in, pulvinar eget purus. Donec diam quam, feugiat eget pulvinar sit amet, mollis sed orci. Suspendisse potenti.",
    location: "Straight up!",
    cost: 0,
    social: true,
    at_home: false
  },
  {
    user_id: 8,
    title: "Eat doughnuts",
    content: "Tim Hortons Inc. (known internationally as Tim Hortons Cafe and Bake Shop) is a Canadian multinational fast casual restaurant[5] known for its coffee and doughnuts. It is also Canada's largest fast food service; at the end of 2013, it had 4,592 restaurants in Canada, 807 in the United States, and 38 in the Persian Gulf region.[6] It was founded in 1964 in Hamilton, Ontario, by Canadian hockey player Tim Horton and Jim Charade, after an initial venture in hamburger restaurants",
    location: "Canucklandia",
    cost: 1,
    social: true,
    at_home: false 
  },
  {
    user_id: 8,
    title: "Wear some plaid",
    content: "O Canada! Our home and native land!
\nTrue patriot love in all thy sons command.
\nWith glowing hearts we see thee rise,
\nThe True North strong and free!
\nFrom far and wide, O Canada,
\nWe stand on guard for thee.
\nGod keep our land, glorious and free!
\nO Canada, we stand on guard for thee;
\nO Canada, we stand on guard for thee.",
    location: "Canucklandia",
    cost: 0,
    social: true,
    at_home: true
  },
  {
    user_id: 9,
    title: "Kittens!",
    content: "Need to chase tail leave fur on owners clothes leave hair everywhere jump off balcony, onto stranger's head or scamper. Meow all night having their mate disturbing sleeping humans climb leg, but always hungry and loves cheeseburgers or sleep in the bathroom sink. Make muffins eat grass, throw it back up. ",
    location: "yard!",
    cost: 1,
    social: true,
    at_home: false 
  },
  {
    user_id: 9,
    title: "Kitty Cat!",
    content: "Chew foot chase mice favor packaging over toy and need to chase tail. Plan steps for world domination chase mice burrow under covers. Chase mice hack up furballs burrow under covers, for chew on cable. ",
    location: "a corner",
    cost: 0,
    social: false,
    at_home: true
  },
  {
    user_id: 9,
    title: "Cat Butts",
    content: "Purr for no reason sleep on keyboard, throwup on your pillow under the bed cat snacks. I like big cats and i can not lie sleep nap yet run in circles lick butt, for chase mice chase ball of string for kick up litter.",
    location: "yard!",
    cost: 0,
    social: false,
    at_home: true
  },
  {
    user_id: 10,
    title: "Braaaaiiinns",
    content: "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia?",
    location: "Apocalypse",
    cost: 1,
    social: false,
    at_home: true
  },
  {
    user_id: 10,
    title: "Braaaaaiiiiiiiiiiinns",
    content: "De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium.",
    location: "Apocalypse NOW",
    cost: 1,
    social: true,
    at_home: false
  },
  {
    user_id: 10,
    title: "Glorp",
    content: "Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. ",
    location: "The decline of civilisation" ,
    cost: 1,
    social: false ,
    at_home: true
  }
]

## START CREATION

# # Creates 10 new tags
tags.each { |name| Tag.create(name: name) }
tags = Tag.all

# # Creates 30 new users
20.times do
  FactoryGirl::create(:user)
end

user = User.first
user.username = 'don_burks'
user.avatar = '/img/social.JPG'
user.save

users = User.all

## Creates 3 activities each for the first 10 users
activities.each do |activity|
  activity = Activity.create(
    user_id: activity[:user_id],
    title: activity[:title],
    location: activity[:location],
    cost: activity[:cost],
    social: activity[:social],
    at_home: activity[:at_home],
    content: activity[:content]
    )
  activity.save
  tags.sample(3).each { |tag| activity.tags << tag }
  activity.save
end

@activities = Activity.all

def review_some_activities(user)
  activities = @activities.sample(5)
  activities.each do |a|
    review = Review.create(
      rating: rand(4)+1,
      user_id: user.id,
      activity_id: a.id,
      comment:"I am reviewing this activity with SO FUN! #{Faker::Lorem.paragraph} MUCH WOW! Tell friends wow much."
     )
    review.save
  end
end
# Each user reviews 5 random activities that they did not author
users.each do |user|
    review_some_activities(user)
end


