# My Users App

## Task
The problem this project addresses is the need for a user management system. The challenge lies in implementing user creation, retrieval, updating, and deletion operations within a web application using Ruby and Sinatra.

## Description
To solve the problem, this application uses Sinatra, a Ruby web framework, along with an SQLite database. It provides a web interface for creating, viewing, updating, and deleting user records. The core functionality is encapsulated in a `User` class that interacts with the database to perform these operations.

## Installation
To install the project, follow these steps:
1. Clone the repository: `git clone <repository_url>`
2. Navigate to the project directory: `cd my-users-app`
3. Install dependencies: `bundle install`
4. Create the database: `bundle exec rake db:migrate`
5. Start the Sinatra server: `bundle exec ruby app.rb`

## Usage
Once the application is running, you can interact with it by accessing the following routes:

- Create a user: `POST /users` - Send a POST request with user data to create a new user.
- Retrieve all users: `GET /users` - Access the list of all users.
- Log in: `POST /sign_in` - Log in with a user's email and password.
- Update user password: `PUT /users` - Update the password of the logged-in user.
- Log out: `DELETE /sign_out` - Log out the currently logged-in user.
- Delete user: `DELETE /users` - Delete the currently logged-in user.

