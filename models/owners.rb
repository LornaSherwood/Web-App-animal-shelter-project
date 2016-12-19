require_relative("../db/sql_runner")

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name, :address_1, :address_2, :address_3

  def initialize( options )
    @id = nil || options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address_1 = options['address_1']
    @address_2 = options['address_2']
    @address_3 = options['address_3']
  end

  def save
    sql = "
      INSERT INTO owners (first_name, last_name, address_1, address_2, address_3)
      VALUES ( '#{first_name}', '#{last_name}', '#{address_1}', '#{address_2}', '#{address_3}')
      RETURNING id;
      "
    owner = SqlRunner.run( sql ).first
    @id = owner['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM owners WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.find_all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |hash| Owner.new( hash ) }
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id=#{id};"
    results = SqlRunner.run( sql ).first
    return Owner.new(results)
  end

  def get_animals
    sql = "SELECT animals.* FROM animals 
          INNER JOIN adoptions ON adoptions.animal_id = animals.id 
          WHERE owner_id = #{@id};"
    results = SqlRunner.run( sql )
    return results.map { |animal| Animal.new( animal ) }
  end

  def self.update(options)
    sql = "UPDATE owners SET
     first_name = '#{options['first_name']}',
     last_name = '#{options['last_name']}',
     address_1 = '#{options['address_1']}',
     address_2 = '#{options['address_2']}',
     address_3 = '#{options['address_3']}'
     WHERE id='#{options['id']}';"
    SqlRunner.run( sql )
  end

end

