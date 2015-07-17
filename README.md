A small TDD Rails API using the JSON-API resources specification: http://jsonapi.org/format/

The database, on Heroku at https://apiimages.herokuapp.com/images, accepts image URLs and optional captions.

```
git clone git@github.com:saramoohead/ruby_json_exercise.git
cd ruby_json_exercise
bundle install
rake db:create
rake db:migrate
rails s
rake

curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"images", "attributes":{"image-url":"http://www.example.com/images/image.jpg", "caption":"Oh happy day!"}}}' https://apiimages.herokuapp.com/images

```
