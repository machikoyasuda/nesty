== README

I am practicing nested routing with embedded documents in MongoDB and Mongoid by creating a JSON API with Ruby on Rails.

Rails resource function will create a set of routes.

1. Create models
2. Fill seeds.rb
3. Create controllers
4. Add routes with resources: resources :designs, except: [ :new, :edit]
5. Set default format to JSON: format: { default: :json }
6. Run 'rake routes' to confirm what routes were created
7. Nest the routes: add block do end and put periods and expectations inside it

