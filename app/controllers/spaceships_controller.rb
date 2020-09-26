class SpaceshipsController < ApplicationController

  # GET: /spaceships
  get "/spaceships" do
    @user = current_user
    @s_ships = current_user.spaceships
    erb :"/spaceships/index"
  end

  # GET: /spaceships/new
  get "/spaceships/new" do
    erb :"/spaceships/new"
  end

  # POST: /spaceships
  post "/spaceships" do
    redirect_if_logged_out
    @spaceship = current_user.spaceships.build(name: params[:name], ship_type: params[:ship_type], description: params[:description])
    if @spaceship.save
      redirect "/spaceships"
    else
      erb :"/spaceships/new"
    end
  end

  # GET: /spaceships/5
  get "/spaceships/:id" do
    @user = current_user
    @spaceship = Spaceship.find(params[:id])
    erb :"/spaceships/show"
  end

  # GET: /spaceships/5/edit
  get "/spaceships/:id/edit" do
    if logged_in?
      @user = current_user
      @spaceship = Spaceship.find(params[:id])
      erb :"/spaceships/edit"
    else
      redirect "/login"
    end
  end

  # PATCH: /spaceships/5
  patch "/spaceships/:id" do
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(name: params[:name], ship_type: params[:ship_type], description: params[:description])
    redirect "/spaceships/#{@spaceship.id}"
  end

  # DELETE: /spaceships/5/delete
  delete "/spaceships/:id/delete" do
    @spaceship = Spaceship.find(params[:id])
    if @spaceship && @spaceship.user == current_user
      @spaceship.destroy
    end
    redirect '/spaceships'
  end
end
