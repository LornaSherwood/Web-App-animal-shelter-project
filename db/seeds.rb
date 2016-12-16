require_relative('../models/owners')
require_relative('../models/animals')

require( 'pry' )

# Owner.delete_all()
# Animal.delete_all()

owner1 = Owner.new({'first_name' => 'Lorna', 'last_name' => 'Sherwood', 'address_1' => '17 Bridge Street', 'address_2' => 'Edinburgh', 'address_3' => 'EH15 1DB'})
owner1.save

animal1 = Animal.new({'name' => 'Misty', 'breed' => 'Collie', 'admission_date' => '2016-12-01', 'status' => 'adopted', 'photo' => 'photos/misty.jpeg' })
animal1.save

binding.pry
nil
