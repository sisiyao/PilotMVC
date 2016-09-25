require 'rack'
require_relative '../lib/router'
require_relative '../lib/show_exceptions'
require_relative '../app/controllers/artists_controller'

router = Router.new
router.draw do
  get Regexp.new("^/$"), ArtistsController, :index
  get Regexp.new("^/artists/new$"), ArtistsController, :new
  get Regexp.new("^/artists/(?<id>\\d+)$"), ArtistsController, :show
  post Regexp.new("^/artists$"), ArtistsController, :create
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

app = Rack::Builder.new do
  use ShowExceptions
  run app
end.to_app

Rack::Server.start(
 app: app,
 Port: 3000
)
