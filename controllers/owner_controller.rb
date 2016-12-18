require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/owners')
require_relative('../models/animals')
require_relative('../models/adoptions')


#get all animals (index)
get '/owners' do
  @owners = Owner.find_all()
  erb(:"owners/index")
end

# create new owner form
get '/owners/new' do
  erb(:"owners/new")
end

#create new owner
post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  erb(:"/owners/create")
end

#get animal by id (show)
get '/owners/:id' do
  id = params[:id]
  @owner = Owner.find(id)
  erb(:"owners/show")
end


