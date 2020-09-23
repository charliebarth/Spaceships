class SpaceshipsController < ApplicationController

  # GET: /spaceships
  get "/spaceships" do
    erb :"/spaceships/index.html"
  end

  # GET: /spaceships/new
  get "/spaceships/new" do
    erb :"/spaceships/new.html"
  end

  # POST: /spaceships
  post "/spaceships" do
    redirect "/spaceships"
  end

  # GET: /spaceships/5
  get "/spaceships/:id" do
    erb :"/spaceships/show.html"
  end

  # GET: /spaceships/5/edit
  get "/spaceships/:id/edit" do
    erb :"/spaceships/edit.html"
  end

  # PATCH: /spaceships/5
  patch "/spaceships/:id" do
    redirect "/spaceships/:id"
  end

  # DELETE: /spaceships/5/delete
  delete "/spaceships/:id/delete" do
    redirect "/spaceships"
  end
end
