require_relative("../db/sql_runner")

class Animal

  attr_reader :id
  attr_accessor :name, :breed, :admission_date, :status, :photo, :owner_id

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @status = options['status']
    @photo = options['photo']
    @owner_id = owner_id['owner_id']
  end

end