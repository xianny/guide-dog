enable :sessions

helpers do

  # returns User Obj
  def current_user
    session[:user_id] ? User.find(session[:user_id]) : User.new
  end

  # returns String
  def username_href(id)
    user = User.find(id)
    user ? "<a href='/users/#{id}'>#{user.username}</a>" : nil
  end

  def all_tags
     Tag.all
  end

  def convert_parameters
    parameters = {}
    if (!params[:at_home] && !params[:outdoor]) || params[:at_home] && params[:outdoor]
      parameters[:at_home] = [true, false]
    elsif params[:at_home] && !params[:outdoor]
      parameters[:at_home] = true
    elsif params[:outdoor] && !params[:at_home]
      parameters[:at_home] = false
    end

    if (!params[:social] && !params[:solo]) || params[:social] && params[:solo]
      parameters[:social] = [true, false]
    elsif params[:social] && !params[:solo]
      parameters[:social] = true
    elsif params[:solo] && !params[:social]
      parameters[:social] = false
    end

    parameters[:cost] = ( params[:cost].nil? ? [0,1,2,3] : params[:cost].to_i )
    parameters
  end

  def to_bool(str)
    case str
    when "TRUE" then true
    when "FALSE" then false
    end
  end
end

# Homepage (Root path)
get '/' do
  @activity = Activity.new
  erb :explore, layout: false
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
    session[:username] = @user.username
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

# Display form to create new activity (by current user)
get '/activities/new' do
  redirect '/sessions/new' if !session[:user_id]
    @activity = Activity.new
    erb :'activities/new'
end

# Display single activity
get '/activities/:a_id' do 
  @activity = Activity.find(params[:a_id])
  @review = Review.new
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


# Create new activity
post '/users/:u_id/activities' do
  redirect '/' if session[:user_id] != params[:u_id].to_i
  @activity = Activity.create(
    user_id:  params[:u_id],
    title:    params[:title],
    cost:     params[:cost].to_i,
    location: params[:location],
    content:  params[:content],
    social:   to_bool(params[:social]),
    at_home:  to_bool(params[:at_home])
  )
  if @activity.save
    tag_names = [params[:tag1],params[:tag2],params[:tag3]]
    tags = Tag.where(name: tag_names)
    tags.each do |tag|
      @activity.tags << tag
    end
    redirect "activities/#{@activity.id}"
  else
    erb :'activities/new'
  end

end

#### REVIEWS ####
#### ------- ####

# Post new review
post '/activities/:a_id/reviews' do
  redirect "/activities/#{params[:a_id]}" if !session[:user_id]
  @activity = Activity.find(params[:a_id].to_i)
  params[:rating] = params[:rating].to_i if params[:rating]
  @review = Review.create(
    comment:      params[:comment],
    rating:       params[:rating],
    activity_id:  params[:a_id].to_i,
    user_id:      session[:user_id] 
  )
  if @review.save
    redirect "/activities/#{params[:a_id]}"
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
  tags = [params[:tag1],params[:tag2],params[:tag3]]
  parameters = convert_parameters
  @activities = Activity.where(
    cost:     parameters[:cost],
    at_home:  parameters[:at_home], 
    social:   parameters[:social]
  )
  erb :'activities/index'
end
