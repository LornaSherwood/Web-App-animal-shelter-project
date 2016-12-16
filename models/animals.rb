require_relative("../db/sql_runner")

class Animal

  attr_reader :id
  attr_accessor :name, :breed, :admission_date, :status, :photo

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @status = options['status']
    @photo = options['photo']
    
  end

  def save
    sql = "
      INSERT INTO animals (name, breed, admission_date, status, photo)
      VALUES ('#{name}', '#{breed}', '#{admission_date}', '#{status}', '#{photo}')
      RETURNING id;
      "
      animal = SqlRunner.run( sql ).first
      id = animal['id'].to_i
  end

end