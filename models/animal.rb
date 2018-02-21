require('pry-byebug')
require_relative("../db/sql_runner")


class Animal
	attr_reader :id, :name, :reg_date, :available, :owner_id

	def initialize(options)
		@id = options['id'].to_i
		@name = options ['name']
    @reg_date = options ['reg_date']
    @available = options ['available']
    @owner_id = options ['owner_id']
end

  	def save()
  		sql = "
  		INSERT INTO animals (name, reg_date, available, owner_id)
  		VALUES ($1, $2, $3, $4) RETURNING id;
  		"
  		values = [@name, @reg_date, @available, @owner_id]
  		animal = SqlRunner.run(sql, values)
  		@id = animal.first['animal_id'].to_i
  	end

    def update()
  		sql = "
  		UPDATE animals SET (name, reg_date, available, owner_id)
  		= ($1, $2, $3, $4) WHERE id= $5;
  		"
  		values = [@name, @reg_date, @available, @owner_id, @id]
      SqlRunner.run( sql, values )
  	end

  	def self.all()
  		sql = "SELECT * FROM  animals;"
  		rows = SqlRunner.run(sql)
  		animal = rows.map {|animal| Animal.new(animal) }
  		return animal
  	end

    def self.find(id)
		sql = "SELECT * FROM animals WHERE id = $1"
        # binding.pry
		values = [id]

		row = SqlRunner.run(sql, values).first()
    # binding.pry
		animal = Animal.new(row)
    # binding.pry

		return animal
	  end

    def self.delete_all()
		sql = "DELETE FROM animals;"
		SqlRunner.run(sql)
	end

  def owner()
		sql = "SELECT * FROM owners WHERE id = $1"
		values = [@owner_id]
		row = SqlRunner.run(sql, values)[0]
		owner = Owner.new(row)
		return owner
	end


end
