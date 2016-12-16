require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/animals')
require_relative('./models/owners')

#get all animals (index)
get '/animals' do
  @animals = Animal.find_all()
  erb(:index)
end