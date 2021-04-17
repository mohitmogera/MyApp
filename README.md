# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	ruby '2.5.8'
* System dependencies
	Make sure ruby has been installed in the system.
	To install rails type the cmd 'gem install rails' once ruby has been installed.
	Check rails version using 'rails -v'
	Install Postgres as well .
* Configuration
	Run 'bundle install' to install dependencies.
* Database creation
	Once postgres is installed , create a db with a username and pass and configure the same in database.yaml file.
* Database initialization
	Run 'rails db:migrate' to migrate the table structure
	Run 'rails db:seed' to import table data.

* Api url's and Request/Response:
Api : Register User
Method : Post  Url:http://127.0.0.1:3000/api/users
Request : {"user":{"email":"test17@gmail.com", "password":"testma", "username":"use17"}}

Api: Login
Method : Post  Url : http://127.0.0.1:3000/api/users/login
Request : {"user":{"email":"test17@gmail.com", "password":"testma"}}
Response : {    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MiwiZXhwIjoxNjIzODU0NTM2fQ.POtXKRytBjJcGzba5u6IEBrnHgiaddbbSeK9GwKG7hw"}

Api :  Search Shipments
Method: Get Url:  http://127.0.0.1:3000/api/shipments/search
Header: Authentication Token token="eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTAsImV4cCI6MTYyMzc0ODYwN30.-wGIHDNZtOvgzAW2uu7p1sFXGQiv9FTLqAIa5OHZNyo"
Request: {    "origin":"MUM",    "destination":"DEL",    "start_date":"26-04-2021" ,    "capacity_in_kg"   :7400}
Response :[{"id":1,"name":"Truck 0D","capacity_in_kg":"7500.0","start_date":"2021-05-04","truck_route_id":4,"origin_id":1,"destination_id":2}]

Api : Make Booking
Method : Post Url: http://127.0.0.1:3000/api/bookings
Header: Authentication Token token="eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTAsImV4cCI6MTYyMzc0ODYwN30.-wGIHDNZtOvgzAW2uu7p1sFXGQiv9FTLqAIa5OHZNyo"
Request: {"quantity_in_kg":"10000","truck_route_id":"9"}
Response : {"id":1,"quantity_in_kg":"10000.0","user_id":10,"truck_route_id":9,"created_at":"2021-04-17T15:08:15.205Z","updated_at":"2021-04-17T15:08:15.205Z"}

Api : Get  Booking History
Method : GET Url: http://127.0.0.1:3000/api/bookings
Header: Authentication Token token="eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTAsImV4cCI6MTYyMzc0ODYwN30.-wGIHDNZtOvgzAW2uu7p1sFXGQiv9FTLqAIa5OHZNyo"
Request: 
Response : [{"id":1,"quantity_in_kg":"10000.0","user_id":10,"truck_route_id":9,"created_at":"2021-04-17T15:08:15.205Z","updated_at":"2021-04-17T15:08:15.205Z"}]


