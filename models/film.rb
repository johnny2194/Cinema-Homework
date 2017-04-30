require_relative ('../db/sql_runner.rb')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @price = params['price'].to_i
  end

  def save()
    sql = "
    INSERT INTO films (
    title,
    price
    ) VALUES (
    '#{@title}',
    #{@price}
    )
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end 

  def update()
    sql = "
    UPDATE films SET(
    title,
    price
    ) = (
    '#{@title}',
    #{@price}
    )
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Film.all()
    sql = "SELECT * FROM films;"
    return SqlRunner.run(sql).map { |film| Film.new(film) }
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id};"
    SqlRunner.run(sql)
  end 

  def Film.find(id)
    sql = "SELECT * FROM films WHERE id = #{id}"
      film = Film.new(SqlRunner.run(sql)[0])
      return film
  end 


  def Film.delete_all()
   sql = "DELETE FROM films"
   SqlRunner.run(sql)
  end





end 