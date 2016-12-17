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




end
