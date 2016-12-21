require_relative('../models/owners')
require_relative('../models/animals')
require_relative('../models/adoptions')

require( 'pry' )

Adoption.delete_all()
Owner.delete_all()
Animal.delete_all()

owner1 = Owner.new({'first_name' => 'Lorna', 'last_name' => 'Sherwood', 'address_1' => '17 Bridge Street', 'address_2' => 'Edinburgh', 'address_3' => 'EH15 1DB'})
owner2 = Owner.new({'first_name' => 'Julia', 'last_name' => 'Franzoi', 'address_1' => 'Lothian Road', 'address_2' => 'Edinburgh', 'address_3' => 'EH1 1AA'})
owner3 = Owner.new({'first_name' => 'Blaisey', 'last_name' => 'Babey', 'address_1' => 'Princes Steet', 'address_2' => 'Glasgow', 'address_3' => 'EH1 1AA'})
owner4 = Owner.new({'first_name' => 'Krisite', 'last_name' => 'York', 'address_1' => 'Main Road', 'address_2' => 'Dunfermline', 'address_3' => 'EH1 1AA'})


owner1.save
owner2.save
owner3.save
owner4.save


animal1 = Animal.new({'name' => 'Misty', 'breed' => 'Collie', 'admission_date' => '2016-12-01', 'status' => 'Adopted', 'photo' => '/images/Misty.jpg' })
animal2 = Animal.new({'name' => 'Breagha', 'breed' => 'Maine Coone', 'admission_date' => '2016-11-20', 'status' => 'In Training', 'photo' => '/images/breagha.jpg' })
animal3 = Animal.new({'name' => 'Smudge', 'breed' => 'Guinea Pig', 'admission_date' => '2016-10-08', 'status' => 'Ready for Adoption', 'photo' => '/images/smudge.jpg' })
animal4 = Animal.new({'name' => 'Alfie', 'breed' => 'Lurcher', 'admission_date' => '2016-11-03', 'status' => 'Adopted', 'photo' => '/images/alfie.jpg' })
animal5 = Animal.new({'name' => 'Olly', 'breed' => 'Octopus', 'admission_date' => '2016-10-03', 'status' => 'In Training', 'photo' => '/images/olly.jpg' })
animal6 = Animal.new({'name' => 'Simba', 'breed' => 'Siamese', 'admission_date' => '2016-10-18', 'status' => 'Ready for Adoption', 'photo' => '/images/simba.jpg' })
animal7 = Animal.new({'name' => 'Bramble', 'breed' => 'Dutch Rabbit', 'admission_date' => '2016-10-11', 'status' => 'Ready for Adoption', 'photo' => '/images/bramble.jpg' })
animal8 = Animal.new({'name' => 'Fly', 'breed' => 'Collie', 'admission_date' => '2016-12-11', 'status' => 'In Training', 'photo' => '/images/fly.jpg' })
animal9 = Animal.new({'name' => 'Bruno', 'breed' => 'Bearded Collie', 'admission_date' => '2016-12-20', 'status' => 'Unassessed', 'photo' => '/images/bruno.jpg' })
animal10 = Animal.new({'name' => 'Nosey', 'breed' => 'Ferret', 'admission_date' => '2016-12-02', 'status' => 'Under Vet Care', 'photo' => '/images/nosey.jpg' })
animal11 = Animal.new({'name' => 'Lassie', 'breed' => 'Terrier cross', 'admission_date' => '2016-11-02', 'status' => 'Ready for Adoption', 'photo' => '/images/lassie.jpg' })




animal1.save
animal2.save
animal3.save
animal4.save
animal5.save
animal6.save
animal7.save
animal8.save
animal9.save
animal10.save
animal11.save



adoption1 = Adoption.new({'animal_id' => animal1.id, 'owner_id' => owner1.id})
adoption1.save
adoption2 = Adoption.new({'animal_id' => animal4.id, 'owner_id' => owner2.id})
adoption2.save

binding.pry
nil

