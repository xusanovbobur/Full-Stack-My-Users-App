require 'sinatra'
require_relative 'my_user_model.rb'

set :bind, '0.0.0.0'
set :port, 8080
enable :sessions

# Create a user and store it in the database, then return the user created
post '/users' do
  user = User.new
  user_info = [params['firstname'], params['lastname'], params['age'], params['password'], params['email']]
  user_id = user.create(user_info)
  "Successfully created a user with userId = #{user_id}"
end

# Return a list of all users
get '/users' do
  user = User.new
  @users = user.all
  erb :index
end

# Log in a user and store their user_id in the session
post '/sign_in' do
  user = User.new
  user_id = user.match(params['email'], params['password'])
  if user_id
    session[:user_id] = user_id[0][0]
    "User successfully logged in with id #{user_id[0][0]}"
  else
    "Invalid email or password"
  end
end

# Update the password of a logged-in user
put '/users' do
  user = User.new
  user_id = session[:user_id]
  if user_id
    user.update(user_id, 'password', params['password'])
    "Successfully updated user"
  else
    "Not authorized user"
  end
end

# Log out a user by deleting the session user_id
delete '/sign_out' do
  user = User.new
  user_id = session[:user_id]
  if user_id
    session.delete(:user_id)
    "User successfully logged out"
  else
    "Not authorized"
  end
end

# Log out and destroy the current user
delete '/users' do
  user = User.new
  user_id = session[:user_id]
  if user_id
    user.destroy(user_id)
    session.delete(:user_id)
    "User successfully logged out and deleted"
  else
    "Not authorized"
  end
end
