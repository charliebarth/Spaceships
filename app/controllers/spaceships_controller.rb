class SpaceshipsController < ApplicationController

  
  get "/spaceships" do
    @user = current_user
    @s_ships = current_user.spaceships
    erb :"/spaceships/index"
  end

  get "/spaceships/new" do
    erb :"/spaceships/new"
  end

  post "/spaceships" do
    redirect_if_logged_out
    @spaceship = current_user.spaceships.build(name: params[:name], ship_type: params[:ship_type], description: params[:description])
    if @spaceship.save
      redirect "/spaceships"
    else
      erb :"/spaceships/new"
    end
  end

  get "/spaceships/:id" do
    @user = current_user
    @spaceship = Spaceship.find(params[:id])
    erb :"/spaceships/show"
  end

  get "/spaceships/:id/edit" do
    if logged_in?
      @user = current_user
      @spaceship = Spaceship.find(params[:id])
      erb :"/spaceships/edit"
    else
      redirect "/login"
    end
  end

  patch "/spaceships/:id" do
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(name: params[:name], ship_type: params[:ship_type], description: params[:description])
    redirect "/spaceships/#{@spaceship.id}"
  end

  delete "/spaceships/:id/delete" do
    @spaceship = Spaceship.find(params[:id])
    if @spaceship && @spaceship.user == current_user
      @spaceship.destroy
    end
    redirect '/spaceships'
  end
end
