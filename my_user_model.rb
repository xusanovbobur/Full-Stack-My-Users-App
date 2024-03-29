require 'sqlite3'

class User
  def initialize
    @db_name = "app_database.db"
  end

  def make_user_hash(data)
    user_hash = {}
    user_hash['first_name'] = data[0]
    user_hash['last_name'] = data[1]
    user_hash['age'] = data[2]
    user_hash['password'] = data[3]
    user_hash['email'] = data[4]
    user_hash
  end

  def create_user(user_data)
    begin
      db = SQLite3::Database.open @db_name
      db.execute "INSERT INTO users VALUES('#{user_data[0]}', '#{user_data[1]}', '#{user_data[2]}', '#{user_data[3]}', '#{user_data[4]}')"
    rescue SQLite3::Exception => e
      puts "Error occurred while creating a user"
      puts e
    ensure
      id = db.last_insert_row_id
      puts "Successfully connected to the database"
      db.close if db
      puts "User created with ID: #{id}"
    end
  end

  def find_user_by_id(user_id)
    begin
      db = SQLite3::Database.open @db_name
      user_data = db.execute "SELECT * FROM users WHERE rowid=#{user_id}"
    rescue SQLite3::Exception => e
      puts "Error occurred while finding a user by ID"
      puts e
    ensure
      db.close if db
      return make_user_hash(user_data[0])
    end
  end

  def get_all_users
    begin
      db = SQLite3::Database.open @db_name
      user_data = db.execute "SELECT * FROM users"
    rescue SQLite3::Exception => e
      puts "Error occurred while fetching all users"
      puts e
    ensure
      db.close if db
      users = []
      user_data.each do |data|
        users << make_user_hash(data)
      end
      return users
    end
  end
  def update_user_attribute(user_id, attribute, value)
    begin
      db = SQLite3::Database.open @db_name
      db.execute "UPDATE users SET #{attribute} = '#{value}' WHERE rowid=#{user_id}"
    rescue SQLite3::Exception => e
      puts "Error occurred while updating a user attribute"
      puts e
    ensure
      db.close if db
      puts "User attribute updated"
    end
  end

  def delete_user(user_id)
    begin
      db = SQLite3::Database.open @db_name
      db.execute "DELETE FROM users WHERE rowid=#{user_id}"
    rescue SQLite3::Exception => e
      puts "Error occurred while deleting a user"
      puts e
    ensure
      db.close if db
      puts "User deleted"
    end
  end
  def find_user_by_credentials(email, password)
    begin
      db = SQLite3::Database.open @db_name
      user_id = db.execute "SELECT rowid FROM users WHERE email = '#{email}' AND password = '#{password}'"
    rescue SQLite3::Exception => e
      puts "Error occurred while finding a user by credentials"
      puts e
    ensure
      db.close if db
      puts "User found by credentials"
      return user_id
    end
  end 
  51614299936
