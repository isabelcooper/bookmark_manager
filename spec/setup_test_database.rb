require_relative '../database_connection_setup'
require 'pg'


def setup_test_database
  setup
  DatabaseConnection.query('TRUNCATE bookmarks;')
end
