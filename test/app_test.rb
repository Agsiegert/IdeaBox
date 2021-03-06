gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/app'
require 'rack/test'

class AppTest < Minitest::Test
include Rack::Test::Methods

def app
IdeaboxApp
end

def test_hello
get "/"
assert_equal "Hello, World", last_response.body
end

def test_create_new_idea
post "/", {idea: {title: "exercise", description: "sign up for stick fighting classes"}}

idea = IdeaStore.all.first
assert_equal "exercise", idea.title
assert_equal "sign up for stick fighting classes", idea.description
end

end

# app.rb file below for test above.

app.rb
require 'sinatra/base'

class IdeaboxApp < Sinatra::Base

get "/" do
"Hello, World"
end

post "/" do
request.body
end

end
