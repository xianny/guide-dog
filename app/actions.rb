# Homepage (Root path)
get '/' do
  erb :index
end

# Display all users
get '/users' do
  erb :'users/index'
end

# Display form to create new user
get '/users/new' do

end

# Create new user (sign up for acount)
post '/users' do

end

# Display single user
get '/users/:u_id' do

end


#### ACTIVITIES ####
#### ---------- ####


# Display activities associated with a single user
get '/users/:u_id/activities' do

end

# Display form to create new activity (by current user)
get '/users/:u_id/activities/new' do

end

# Create new activity
post '/users/:u_id/activities' do

end

# Display single activity
get '/users/:u_id/activities/:a_id' do 

end

#### REVIEWS ####
#### ------- ####


# Display all reviews associated with the activity
get '/users/:u_id/activities/:a_id/reviews' do

end

# Display form to post new review
get '/users/:u_id/activities/:a_id/reviews/new' do

end

# Post new review
post '/users/:u_id/activities/:a_id/reviews' do

end

# Display a single review
get '/users/:u_id/activities/:a_id/reviews/:r_id' do

end

#### SEARCH FUNCTIONS ####
#### ---------------- ####

## Display activities by parameters
# params = {
#   location: 'string'
#   cost: in: [0,1,2,3]
#   at_home: boolean
#   social: boolean
#   user_id: integer
# }
get '/activities' do
  # generate collection of activities based on parameters
  # set as instance variable @activities
  # call erb: 'activities/index'
end