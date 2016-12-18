require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/animals')
require_relative('../models/owners')
require_relative('../models/adoptions')


#get all animals (index)
get '/animals' do
  @animals = Animal.find_all()
  erb(:"animals/index")
end

# create new animal form
get '/animals/new' do
  erb(:"animals/new")
end

#create new animal
post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  erb(:"/animals/create")
end

#get animal by id (show)
get '/animals/:id' do
  id = params[:id]
  @animal = Animal.find(id)
  erb(:"animals/show")
end

# edit animal form
get '/animals/:id/edit' do
 @animal = Animal.find(params[:id])
 erb(:"animals/edit")
end

# update animal by id
post '/animals/:id' do  
  Animal.update( params ) 
  redirect to("/animals/#{params[:id]}")
end




