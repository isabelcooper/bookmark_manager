describe DatabaseConnection do
  let(:pg_double) { double(:pg_double, connect: connection_double) }
  let(:connection_double) { double(:connection_double, exec: "query result") }
  let(:database) { 'bookmark_manager_test' }

  describe '#setup' do
    it 'should establish a connection to a given database' do
      DatabaseConnection.setup(database, pg_double)
      expect(DatabaseConnection.database).to eq connection_double
    end

    it 'should send connection request to given database' do
      expect(pg_double).to receive(:connect).with(dbname: database)
      DatabaseConnection.setup(database, pg_double)
    end
  end

  describe '#query' do
    it 'should execute SQL query' do
      DatabaseConnection.setup(database, pg_double)
      expect(DatabaseConnection.query("SQL QUERY")).to eq "query result"
    end
  end
end
