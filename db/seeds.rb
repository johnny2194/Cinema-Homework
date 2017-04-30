require( 'pry-byebug' )
require_relative('../models/customer.rb')


customer1 = Customer.new({
 'name' => 'Johnny Watson',
 'funds' => '500'
  })
customer1.save()


binding.pry
nil 