class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 

  post '/recipes' do
    @recipe = Article.create(params)
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end 

  

  

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end 

  get '/recipes/:id/edit' do  
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:recipe[name]]
    @recipe.ingredients = params[:recipe[ingredients]]
    @recipe.cook_time = params[:recipe[cook_time]]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end 


end
