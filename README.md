1. Get the project:
git clone https://github.com/mariosepp/rails-angular-forum.git

2. Install gems:
bundle

3. Install assets:
bower install

4. Set up the database username and password in config/database.yml.

5. Migrate the database and insert admin user:
rake db:setup

6. Run:
rails s

7. Go to http://localhost:3000/#/home

8. Create a new account or login with admin:
username: admin
password: password