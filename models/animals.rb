require_relative("../db/sql_runner")

class Animal

  attr_reader :id
  attr_accessor :name, :breed, :admission_date, :status, :photo

  def initialize( options )
    # if options['id'] != nil
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
      RETURNING *;
      "
    animal = SqlRunner.run( sql ).first
    @id = animal['id'].to_i
  end

  def date_format
    date = @admission_date.split("-")
    return "#{date[2]}/#{date[1]}/#{date[0]}"
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM animals WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.find_all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Animal.new( hash ) }
  end

  def self.find_by_status(status) # not used yet
    sql = "SELECT * FROM animals WHERE status = '#{ status }';"
    results = SqlRunner.run( sql )
    return results.map { |hash| Animal.new( hash ) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id=#{id}"
    results = SqlRunner.run( sql ).first
    return Animal.new(results)
  end

  def self.update(options)
    sql = "UPDATE animals SET
      name = '#{options['name']}',
      breed = '#{options['breed']}',
      admission_date = '#{options['admission_date']}',
      status = '#{options['status']}',
      photo = '#{options['photo']}'
      WHERE id='#{options['id']}';"
    SqlRunner.run( sql )
  end

  def duration
    duration = Date.today - Date.parse(@admission_date)
    return duration.to_i
  end

end
