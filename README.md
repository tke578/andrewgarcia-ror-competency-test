# Articles

View some interesting articles!

### Local Environment set up



Download Docker

` docker build  -t andrewgarcia-ror-competency-test .`

```docker-compose up```

Run migrations

Open a new shell tab and `cd` into root dir

`docker-compose run web bundle exec rake db:migrate`

Port 3000 will be exposed.

To seed db

`docker-compose run web bundle exec rake db:seed`

To run tests

`docker-compose run web bundle exec rails test`


### Core Resources

| Resource  | Description |
| :--- | :--- |
| `Users` |  CRUD for Users. Also login `/sign_in` sign up `/sign_up`. Only users with role admin can create users. |
| `Articles` |  CRUD for Articles.  Certain users with types of roles have specific permissions. |
