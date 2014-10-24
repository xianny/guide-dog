enable :sessions

helpers do

  # returns User Obj
  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  # returns String
  def get_username(id)
    User.find(id).username || nil
  end
 
end

# Homepage (Root path)
get '/' do
  erb :index
end

# Display all users(?) nest some other ERBs.
get '/users' do
end


# Display form to create new user
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

# Create new user (sign up for acount)
# Email and avatar are optional params
post '/users' do
  @user = User.new(
          username:              params[:username],
          password:              params[:password],
          password_confirmation: params[:password_confirmation],
          email:                 params[:email],
          email_confirmation:    params[:email_confirmation],
          avatar:                params[:avatar],
        )
  if user.save
    redirect '/users/#{user.id}'
  else
    erb :'users/new'
  end
end

# Display single user
get '/users/:u_id' do
  @user = User.find(params[:u_id])
  # shows a single user. should have a nested erb: 'users/:u_id/activities'
  erb :'users/show'  
end

# Display login screen
get '/sessions/new' do
  @user = User.new
  erb :'/sessions/new'
end

# Logs in
post '/sessions' do
  @user = User.where(
    username: params[:username],
    password: params[:password]
  ).first
  if user
    session[:user_id] = user.id 
    redirect '/'
  else
    erb :'sessions/new'
  end
end



#### ACTIVITIES ####
#### ---------- ####


# Display activities associated with a single user
# this is not a publicly available path. see users/show
# get '/users/:u_id/activities' do

# end

# Display form to create new activity (by current user)
get '/users/:u_id/activities/new' do
  erb :'activities/new', layout: :'activities/layout'
end

# Create new activity
post '/users/:u_id/activities' do
  user = User.find(params[:u_id])
  @activity = Activity.new(
    user_id:  params[:u_id],
    title:    params[:title],
    cost:     params[:cost],
    location: params[:location],
    content:  params[:content],
    social:   params[:social],
    at_home:  params[:at_home]
  )
  if activity.save
    redirect 'users/#{params[:u_id]}'
  else
    erb :'activities/new', layout: :'activities/layout'
  end

end

# Display single activity
get '/activities/:a_id' do 
  @activity = Activity.find(params[:a_id])
  erb :'activities/show', layout: :'activities/layout'
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
  @activities = Activity.all
  erb :'activities/index', layout: :'activities/layout'
end
