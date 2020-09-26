class UsersController < ApplicationController


  get "/users/new" do
    if logged_in?
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    else
      erb :"/users/create_user"
    end
  end

  post "/users" do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    if user.save 
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/users/new'
    end
  end

  get "/users/:id" do
    @user = User.find(session[:user_id])
    erb :"/users/show"
  end

  get "/users/:id/edit" do
    @user = User.find(session[:user_id])
    erb :"/users/edit"
  end

  patch "/users/:id" do
    @user = User.find(session[:user_id])
    @user.update(username: params[:username], email: params[:email], password: params[:password])
    redirect "/users/#{@user.id}"
  end

  delete "/users/:id/delete" do
    @user = User.find(session[:user_id])
    @user.destroy
    redirect "/"
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
