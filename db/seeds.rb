require_relative('../models/owners')
require_relative('../models/animals')

require( 'pry' )

Owner.delete_all()
Animal.delete_all()

owner1 = Owner.new({'first_name' => 'Lorna', 'last_name' => 'Sherwood', 'address_1' => '17 Bridge Street', 'address_2' => 'Edinburgh', 'address_3' => 'EH15 1DB'})
owner2 = Owner.new({'first_name' => 'Julia', 'last_name' => 'Franzoi', 'address_1' => 'Lothian Road', 'address_2' => 'Edinburgh', 'address_3' => 'EH1 1AA'})
owner1.save
owner2.save

animal1 = Animal.new({'name' => 'Misty', 'breed' => 'Collie', 'admission_date' => '2016-12-01', 'status' => 'adopted', 'photo' => 'photos/misty.jpeg' })
animal2 = Animal.new({'name' => 'Breagha', 'breed' => 'Maine Coone', 'admission_date' => '2016-11-20', 'status' => 'in training', 'photo' => 'photos/breagha.jpeg' })
animal3 = Animal.new({'name' => 'Smudge', 'breed' => 'Guinea Pig', 'admission_date' => '2016-10-08', 'status' => 'ready for adoption', 'photo' => 'photos/smudge.jpeg' })
animal4 = Animal.new({'name' => 'Alfie', 'breed' => 'Lurcher', 'admission_date' => '2016-11-03', 'status' => 'under vet care', 'photo' => 'photos/alfie.jpeg' })
animal1.save
animal2.save
animal3.save
animal4.save


binding.pry
nil
