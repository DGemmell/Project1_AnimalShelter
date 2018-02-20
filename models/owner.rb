require_relative("../db/sql_runner")

class Owner
	attr_reader  :id, :name, :contact

	def initialize(options)
		@id = options['id'].to_i
		@name = options ['name']
    @contact = options ['contact']
  end

  def save()
    sql = "
    INSERT INTO owners (name, contact)
    VALUES ($1, $2) RETURNING id;
    "
    values = [@name, @contact]
    owner = SqlRunner.run(sql, values)
    @id = owner.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    rows = SqlRunner.run(sql)
    owner = rows.map {|owner| Owner.new(owner) }
    return owner
  end

  def self.delete_all()
  sql = "DELETE FROM owners;"
  SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * from owners WHERE id = $1"
    values = [id]
    row = SqlRunner.run(sql, values).first
    owner = Owner.new(row)
    return owner
  end


  def animal()
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [@id]
    row = SqlRunner.run(sql, values)[0]
    animal = Animal.new(row)
    return animal
  end

  def animals()
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [@id]
    rows = SqlRunner.run(sql, values)
    return rows.map{|animal| Animal.new(animal) }
  end

end
