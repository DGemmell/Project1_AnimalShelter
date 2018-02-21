require("sinatra")
require("pry-byebug")
require("sinatra/contrib/all")

require_relative("./models/animal.rb")
require_relative("./models/owner.rb")

#index
get "/animals" do
	@animals = Animal.all()
	erb(:index)
end


#new animal
get "/animals/new" do
	@animals = Animal.all()
  @owners = Owner.all()
	erb(:newanimal)
end

#create animal
post "/animals" do
  animal = Animal.new(params)
	animal.save()
	redirect to "/animals"
end

#animal owner
get "/animals/owner" do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:showowner)
end

#update animal availability and owner
get "/animals/:id" do
@animal = Animal.find(params[:id])
@owners = Owner.all()
# @animal.owner.id
erb(:updateanimal)
end

#update animal
post "/animals/:id" do
  animal = Animal.new(params)
  animal.update()
  # redirect
  redirect to "/animals"
end
