# animal-shelter

This is my first solo project for CodeClan.

It uses Ruby, Sinatra, SQL, HTML & CSS.



To run from command line:

    createdb pet_shelter

    psql -d pet_shelter -f db/pet_shelter.sql

    ruby db/seeds.rb  

    ruby app.rb 
    
Then it should run on localhost.

The spec was as follows:

Animal Shelter

The Scottish Animal Shelter accepts orphaned or stray animals and takes care of them until they can be adopted by a new owner. The shelter has a list of potential new owners for the animals. Animals may take a while to be trained up and made healthy before being available for adoption.

They are looking for a management system to keep track of their animals and owners.

MVP:

A list of all their animals and their admission date
Mark an animal as being adoptable/not adoptable
Assign an animal to a new owner
List all the owners and their adopted animals
Possible Extensions:

CRUD actions for animals/owners
Have separate pages for animals ready for adoption and ones still in training/vet care
Search for animals by breed/type
Any other ideas you might come up with

Improvements:

There are 3 sql tables where only 2 are necessary.
There are two places where an adoption is recorded which could lead to a mismatch.
