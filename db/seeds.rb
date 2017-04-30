require( 'pry-byebug' )
require_relative('../models/customer.rb')
require_relative('../models/film.rb')

customer1 = Customer.new({
 'name' => 'Johnny Watson',
 'funds' => '500'
  })
customer1.save()

film1 = Film.new({
 'title' => 'Guardians of the Galaxy 2',
 'price' => '8'
  })
film1.save()

binding.pry
nil 