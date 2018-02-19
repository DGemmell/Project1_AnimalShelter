require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/animal.rb")

get "/animals" do
	@animals = Animal.all()
	erb(:index)
end

get "/animals/new" do
	@animals = Animal.all()
	erb(:new)
end
