enable :sessions

helpers do

  # returns User Obj
  def current_user
    session[:user_id] ? User.find(session[:user_id]) : User.new
  end

  # returns String
  def get_username(id)
    User.find(id).username || nil
  end

  def all_tags
     Tag.all
  end
 
end

# Homepage (Root path)
get '/' do
  erb :index
end

# Display nothing. Redirects to root
get '/users' do
  redirect '/'
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
  redirect "/users/#{params[:u_id]}/activities" 
end

# Display login screen
get '/sessions/new' do
  @user = User.new
  erb :'/sessions/new', layout: false
end

# Logs in
post '/sessions' do
  @user = User.where(
    username: params[:username],
    password: params[:password]
  ).first
  if @user
    session[:user_id] = @user.id 
    redirect "/users/#{@user.id}"
  else
    @user = User.new(
      username: params[:username],
      password: params[:password]
    )
    @user.errors[:sessions] << 'Something went wrong'
    erb :'sessions/new', layout: false
  end
end

# Logs out
post '/sessions/delete' do
  session.clear
  @activities = Activity.all
  redirect '/activities'
end


#### ACTIVITIES ####
#### ---------- ####

# Display single activity
get '/activities/:a_id' do 
  @activity = Activity.find(params[:a_id])
  erb :'activities/show'
end


get '/activities' do
  @activities = Activity.all
  erb :'activities/index'
end

# Display single user's activities, with option to create new
get '/users/:u_id/activities' do
  user = User.find(params[:u_id])
  @activities = user.activities
  erb :'activities/index'  
end

# Display form to create new activity (by current user)
get '/users/:u_id/activities/new' do
  # if session[:user_id] == params[:user_id]
    @activity = Activity.new
    erb :'activities/new'
  # end
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
    erb :'activities/new'
  end

end

#### REVIEWS ####
#### ------- ####

# Post new review
post '/activities/:a_id/reviews' do
  redirect "/activities/#{params[:a_id]}" if !session[:user_id]
  reviewer =   User.find(session[:user_id])
  author = User.find(params[:u_id])
  
  @activity = Activity.find(params[:a_id])

  @review = Review.create(
    comment:      params[:comment],
    rating:       params[:rating],
    activity_id:  params[:a_id],
    user_id:      session[:user_id] 
  )

  if @review.save
    redirect "users/#{params[:u_id]}/activities/#{params[:a_id]}"
  else
    erb :'activities/show'
  end

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

post '/activities' do
  #-- strip duplicate tags from input (tag1, tag2, tag3)
  # generate collection of activities based on parameters
  # set as instance variable @activities
  # call erb: 'activities/index'
  @search = {

  }
  @activities = Activity.all
  erb :'activities/index'
end
