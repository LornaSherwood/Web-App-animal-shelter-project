require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/animals')
require_relative('../models/owners')
require_relative('../models/adoptions')


#get all adoptions (index)
get '/adoptions' do
  @adoptions = Adoption.find_all()
  erb(:"adoptions/index")
end

# create new adoption - form
get '/adoptions/new' do
  @animals = Animal.find_all
  @owners = Owner.find_all
  erb(:"adoptions/new")
end

# create a new adoption
post '/adoptions' do
  @adoption = Adoption.new( params )
  @adoption.save
  @adoption.update_status  # to change animal status to adopted
  redirect to('/adoptions')
end

# delete by id
post '/adoptions/:id/delete' do
  Adoption.delete( params[:id] )
  redirect to('/adoptions')
end

#get adoption by id (show)
get '/adoptions/:id' do
  id = params[:id]
  @adoption = Adoption.find(id)
  erb(:"adoptions/show")
end

