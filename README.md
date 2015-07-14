A failed attempt at a TDD Rails API using the JSON-API resources specification: http://jsonapi.org/format/

While CURL requests work for both the images and associated captions, I cannot figure out how to pass the POST request in the feature test.

Perhaps because JSON-API resources is still new, I've found very little help on testing. I tried both approaches in this issue thread, but think something in my set up must be getting in the way of success: https://github.com/cerebris/jsonapi-resources/issues/151.

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
