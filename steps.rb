
https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two


# rails new todolist --api --database=postgresql
# rails new todolist --api
rails new api_service -T
cd api_service

rails g scaffold todo title:string description:text done:boolean
rails g scaffold item name:string done:boolean todo:references

# rails new todolist --api --database=postgresql
# rails new todolist --api

rake db:migrate
# rails g controller Todos
# rails g controller Todos
# rails g controller Items
rails g cancan:ability
rails g rspec:install

class ApplicationController < ActionController::API
end
