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

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def self.find_all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Animal.new( hash ) }
  end

  def self.find_available
    sql = "SELECT * FROM animals WHERE status = 'ready for adoption';"
    results = SqlRunner.run( sql )
    return results.map { |hash| Animal.new( hash ) }
  end

  def self.find_adopted
    sql = "SELECT * FROM animals WHERE status = 'adopted';"
    results = SqlRunner.run( sql )
    return results.map { |hash| Animal.new( hash ) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id=#{id}"
    results = SqlRunner.run( sql ).first
    return Animal.new(results)
  end

end