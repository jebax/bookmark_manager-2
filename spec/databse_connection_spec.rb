require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'can successfully setup a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'can perform a database query' do
      connection = described_class.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('query')
      DatabaseConnection.query('query')
    end
  end

end
