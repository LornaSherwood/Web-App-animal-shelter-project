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

end

