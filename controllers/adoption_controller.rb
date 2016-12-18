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
  erb(:"adoptions/create")
end

