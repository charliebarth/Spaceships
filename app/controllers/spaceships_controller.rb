class SpaceshipsController < ApplicationController

  
  get "/spaceships" do
    redirect_if_logged_out
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
    redirect_if_logged_out
    @spaceship = Spaceship.find(params[:id])
    redirect_if_not_authorized
    erb :"/spaceships/show"
  end

  get "/spaceships/:id/edit" do
    if logged_in?
      @spaceship = Spaceship.find(params[:id])
      redirect_if_not_authorized
      erb :"/spaceships/edit"
    else
      redirect "/login"
    end
  end

  patch "/spaceships/:id" do
    redirect_if_logged_out
    @spaceship = Spaceship.find(params[:id])
    redirect_if_not_authorized
    @spaceship.update(name: params[:name], ship_type: params[:ship_type], description: params[:description])
    redirect "/spaceships/#{@spaceship.id}"
  end

  delete "/spaceships/:id/delete" do
    redirect_if_logged_out
    @spaceship = Spaceship.find(params[:id])
    redirect_if_not_authorized
    if @spaceship && @spaceship.user == current_user
      @spaceship.destroy
    end
    redirect '/spaceships'
  end
end
