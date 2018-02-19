require_relative("../db/sql_runner")

class Animal
	attr_reader :animal_id, :name, :reg_date, :available, :owner_id

	def initialize(options)
		@animal_id = options['id'].to_i
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
  		@animal_id = animal.first['animal_id'].to_i
  	end

  	def self.all()
  		sql = "SELECT * FROM  animals;"
  		rows = SqlRunner.run(sql)
  		all_animals = rows.map {|animal| Animal.new(animal) }
  		return all_animals
  	end

    def self.find(id)
		sql = "SELECT * FROM animals WHERE animal_id = $1"
		values = [id]
		row = SqlRunner.run(sql, values)[0]
		animal = Animal.new(row)
		return Animal
	  end

    def self.delete_all()
		sql = "DELETE FROM animals;"
		SqlRunner.run(sql)
	end

  def owner(owner_id)
		sql = "SELECT * FROM owners WHERE id = $1"
		values = [@owner_id]
		row = SqlRunner.run(sql, values)[0]
		owner = Owner.new(row)
		return owner
	end


end
