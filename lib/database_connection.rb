class DatabaseConnection

  attr_reader :database

  def self.setup(database, pg = PG)
    @database = pg.connect(dbname: database)
  end

  def self.database
    @database
  end

  def self.query(sql_query)
    @database.exec(sql_query)
  end
end
