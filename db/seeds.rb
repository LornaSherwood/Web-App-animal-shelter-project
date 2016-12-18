require_relative('../models/owners')
require_relative('../models/animals')
require_relative('../models/adoptions')

require( 'pry' )

Adoption.delete_all()
Owner.delete_all()
Animal.delete_all()

owner1 = Owner.new({'first_name' => 'Lorna', 'last_name' => 'Sherwood', 'address_1' => '17 Bridge Street', 'address_2' => 'Edinburgh', 'address_3' => 'EH15 1DB'})
owner2 = Owner.new({'first_name' => 'Julia', 'last_name' => 'Franzoi', 'address_1' => 'Lothian Road', 'address_2' => 'Edinburgh', 'address_3' => 'EH1 1AA'})
owner1.save
owner2.save

animal1 = Animal.new({'name' => 'Misty', 'breed' => 'Collie', 'admission_date' => '2016-12-01', 'status' => 'adopted', 'photo' => '/images/Misty.jpg' })
animal2 = Animal.new({'name' => 'Breagha', 'breed' => 'Maine Coone', 'admission_date' => '2016-11-20', 'status' => 'in training', 'photo' => '/images/breagha.jpg' })
animal3 = Animal.new({'name' => 'Smudge', 'breed' => 'Guinea Pig', 'admission_date' => '2016-10-08', 'status' => 'ready for adoption', 'photo' => '/images/smudge.jpg' })
animal4 = Animal.new({'name' => 'Alfie', 'breed' => 'Lurcher', 'admission_date' => '2016-11-03', 'status' => 'under vet care', 'photo' => '/images/alfie.jpg' })
animal1.save
animal2.save
animal3.save
animal4.save


adoption1 = Adoption.new({'animal_id' => animal1.id, 'owner_id' => owner1.id})
adoption1.save
adoption2 = Adoption.new({'animal_id' => animal4.id, 'owner_id' => owner2.id})
adoption2.save

binding.pry
nil

