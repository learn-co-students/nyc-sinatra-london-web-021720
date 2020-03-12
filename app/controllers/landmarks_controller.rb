class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :"landmarks/edit"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks' do
    Landmark.create params[:landmark]
    redirect "/landmarks"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

end
