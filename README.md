### Requirements
It is recommended that you have the following set up on your local environment before getting started
- Rails 6.0 or later
- ruby > 3.5
- PostgreSQL. preferably 9.5 or later

### Installation
Clone the repository into your machine
`$ git clone https://github.com/miritih/movie_store.git`

Change directory into movie_store
`$ cd movie_store`

Install project dependencies
`bundle install`

Finally run app
`rails c`

### Api Endpoints
1. Movie Endpoints
- `GET /api/v1/movies`  Get all movies
- `POST /api/v1/movies`  Creates a new movie
- `GET /api/v1/movie/<movie_id>` view a movie
- `PUT /api/v1/movie/<movie_id>` Update movie
- `DELETE /api/v1/movie/<movie_id>` delets a movie
2. users Endpoints
- `POST /api/v1/users` create a new User
