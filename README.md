# AbTestGroup & Participants

This project is to showcase a backend REST API that will allow the CRUD operations of these AbTestGroup & Participants

## Installation

### Database is postgres SQL  
You will find the database configuration in  
Make sure you change the `username` & `password` of the database


`config/database.yml`  
```python
# To migrate the database run
db:migrate

# To populate the database with data run
db:seed

```
NOTE: Please make sure you install postgres in order to run the project.

## Starting the project
To Start the project just run: 

`rails s`

## RSpec Testing
To Run Unit tests coverage for both controllers run:  
`bundle exec rspec spec/controllers/spec_participants.rb`  
`bundle exec rspec spec/controllers/spec_ab_test_groups.rb`  


## CORS
To change origins to appropriate domain just go to:  

`config/initializers/cors.rb`  

change `origins '*'` to Appropriate domain name.

## Routes
GET `/api/ab_test_groups`  
POST`/api/ab_test_groups`  
PATCH`/api/ab_test_groups/:id`  
DELETE`/api/ab_test_groups/:id`  

GET `/api/participants`  
POST `/api/participants`  
PATCH `/api/participants/:id`  
DELETE `/api/participants/:id`  

POST `/api/participants/add_by_group_name/:group_name`  
