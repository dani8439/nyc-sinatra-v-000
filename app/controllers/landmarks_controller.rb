class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @landmark = Landmark.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
    redirect to :"landmarks/#{@landmark.id}"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:landmark])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    redirect to :"landmarks/#{@landmark.id}"
  end
end
