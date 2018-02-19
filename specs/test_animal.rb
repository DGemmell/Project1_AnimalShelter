require('MiniTest/autorun')
require('Minitest/rg')
require_relative("../animal.rb")

class TestAnimal < MiniTest:: Test

def setup()
    @animal = Animal.new("id", "name", "reg_date", "available","owner_id")
end

def test_name
  assert_equal("Freddy", @animal.name)
end

def test_available
  assert_equal("True", @animal.available)
end

end
