require( 'pry-byebug' )
require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

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

ticket1 = Ticket.new({
 'customer_id' => customer1.id,
 'film_id' => film1.id
  })
ticket1.save()

binding.pry
nil 
