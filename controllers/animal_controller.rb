require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/animals')
require_relative('../models/owners')


#get all animals (index)
get '/animals' do
  @animals = Animal.find_all()
  erb(:"animals/index")
end

#get animal by id (show)
get '/animals/:id' do
  id = params[:id]
  @animal = Animal.find(id)
  erb(:"animals/show")
end
