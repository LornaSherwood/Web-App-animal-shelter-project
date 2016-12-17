require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/owners')
require_relative('../models/animals')

#get all animals (index)
get '/owners' do
  @owners = Owner.find_all()
  erb(:"owners/index")
end

#get animal by id (show)
get '/owners/:id' do
  id = params[:id]
  @owner = Owner.find(id)
  erb(:"owners/show")
end


