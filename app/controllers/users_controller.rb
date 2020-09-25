class UsersController < ApplicationController

  # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end
  
  # GET: /signup
  get "/users/new" do
    if logged_in?
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    else
      erb :"/users/create_user"
    end
  end
  
  # POST: /create_new_user
  post "/users" do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    if user.save 
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/users/new'
    end
  end
  
  # GET: /show_current_user
  get "/users/:id" do
    @user = User.find(session[:user_id])
    erb :"/users/show"
  end
  
  # GET: /edit_user
  get "/users/:id/edit" do
    @user = User.find(session[:user_id])
    erb :"/users/edit"
  end
  
  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find(session[:user_id])
    
    redirect "/users/#{@user.id}"
  end
  
  # DELETE: /delete_current_user
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get "/login" do
    if logged_in?
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    else
      erb :"/users/login"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else 
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else 
      redirect '/'
    end
  end
end
