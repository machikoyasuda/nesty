## Practicing nested routes in Rails and MongoDB

I am practicing nested routing with embedded documents in MongoDB and Mongoid by creating a JSON API with Ruby on Rails. We will create a JSON API with Ruby on Rails with Mongoid. We will use an HTTP client to test the HTTP actions.

1. Create models (Designs, expectations, periods)
2. Fill seeds.rb
3. Create controllers (Designs, expectations, periods)
4. Add routes with resources: resources :designs, except: [ :new, :edit]
5. Set default format to JSON: format: { default: :json }
6. Run 'rake routes' to confirm what routes were created
7. Nest the routes: add block do end and put periods and expectations inside it
8. In your initial controller (that embeds everything), write out methods for CRUD actions.
9. You'll need a private method to get_design_id and a strong params method for Update.

Now for the nested part:

The fastest way to do the nested routes is to grab all CRUD methods and copy it into the next controllers and change the controller names and variable names. Then, we'll start changing methods one-by-one to make sure that we're accessing embedded models, not just regular models.

1. Delete "create"
2. Update "update" - if there is no design, create the design WITHIN "update" method.
3. Take out "head :not_found unless @design" out of private action
4. Add else "head :not_found" in show, destroy
5. Conclusion: In "update", if you found a design, update it. If it didn't find a design, create it.
6. Must tell system what the ID is for new created designs. Add new field in design.rb: field: id, type:String model. Give all your models its own id field.
7. Write method in ApplicationController to get_uuids(num). (0...num).to_a.map do |m| SecureRandom.uuid
8. Add new route. get "uuid" => "site#uuids", get "uuid/:num" => "site#uuids"
9. In SiteController, in def uuids, num = (params[:num] || "1").to_i. render :json => { uuids: get_uuids(num) }

