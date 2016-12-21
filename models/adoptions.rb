require_relative("../db/sql_runner")

class Adoption

  attr_reader :id
  attr_accessor :animal_id, :owner_id

  def initialize( options )
    @id = nil || options['id'].to_i
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save
    sql = "
      INSERT INTO adoptions( animal_id, owner_id )
      VALUES (#{ @animal_id }, #{ owner_id })
      RETURNING id;"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM adoptions WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.find_all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Adoption.new( hash ) }
  end

  def owner
    sql = "
      SELECT * FROM owners o
      WHERE id = #{@owner_id};"
    results = SqlRunner.run( sql )
    return Owner.new( results.first )
  end

  def animal
    sql = "
      SELECT * FROM animals
      WHERE id = #{@animal_id};"
    results = SqlRunner.run( sql )
    return Animal.new( results.first )
  end

  def update_status
    animal1 = animal()
    animal1.status = 'Adopted'
    sql = "UPDATE animals SET ( status ) = ( '#{animal1.status}' ) WHERE id = #{animal1.id};"
    SqlRunner.run( sql )
  end

end


