# Homepage (Root path)
get '/' do
  erb :index
end

# User profile page
get '/user' do
  erb :'users/index'
end

get '/activities' do
  erb :'activities/index'
end
