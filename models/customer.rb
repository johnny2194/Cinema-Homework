require_relative ('../db/sql_runner.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @funds = params['year'].to_i
  end

  def save()
    sql = "
    INSERT INTO customers (
    name,
    funds
    ) VALUES (
    '#{@name}',
    #{@funds}
    )
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "
    UPDATE customers SET(
    name,
    funds
    ) = (
    '#{@name}',
    #{@funds}
    )
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Customer.all()
    sql = "SELECT * FROM customers;"
    return SqlRunner.run(sql).map { |customer| Customer.new(customer) }
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end 

  def Customer.find(id)
    sql = "SELECT * FROM customers WHERE id = #{id}"
      customer = Customer.new(SqlRunner.run(sql)[0])
      return customer
  end 


  def Customer.delete_all()
   sql = "DELETE FROM customers"
   SqlRunner.run(sql)
  end





end 