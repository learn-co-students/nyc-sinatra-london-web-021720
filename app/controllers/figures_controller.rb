class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @landmark = Landmark.find_or_create_by(params[:landmark])
    @landmark.update(figure: @figure)
    redirect "/figures/#{@figure.id}"
  end

  post '/figures' do
    figure = Figure.create(params["figure"])
    if params["title"]["name"] != ""
      title = Title.create(params["title"])
      figure.titles << title
    end
    if params["landmark"]["name"] != ""
      landmark = Landmark.create(params["landmark"])
      figure.landmarks << landmark
    end
    figure.save
  end
end
