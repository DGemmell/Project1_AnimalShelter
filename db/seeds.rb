require_relative("../models/animal.rb")
require_relative("../models/owner.rb")
require("pry-byebug")

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({'name' => 'May Carden', 'contact' => '01416373404'})
owner1.save

owner2 = Owner.new({'name' => 'Lesley Maguire', 'contact' => '01416374449'})
owner2.save

animal1 = Animal.new({'name' => 'Freddy',
  'reg_date' => 'March 27 2017',
  'available' => false,
  "owner_id" => owner1.id
})
animal1.save()

animal2 = Animal.new({'name' => 'Charlie',
  'reg_date' => 'March 27 2017',
  'available' => false,
  'owner_id' => owner2.id
})
animal2.save()

animal3 = Animal.new({'name' => 'Monty',
  'reg_date' => 'March 28 2017',
  'available' => true,
  'owner_id' => owner2.id
})
animal3.save()





binding.pry
nil
