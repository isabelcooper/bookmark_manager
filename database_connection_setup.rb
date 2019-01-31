def setup
  database = ENV['ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  DatabaseConnection.setup(database)
end
