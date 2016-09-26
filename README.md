# Ruby on Pilot

## Overview

Ruby on Pilot is a lightweight MVC framework inspired by the functionality of Ruby on Rails and built using metaprogramming techniques. The features in this framework include:
* An ORM inspired by `ActiveRecord`
* `Controller::Base` with basic functionality similar to `ActionController::Base`
* Routes and router
* Ability to implement `session`, `flash`, and `flash.now` cookies
* CSRF protection with a form authenticity token
* Rack middleware to show runtime errors
* Rack middleware to serve up static css assets

Framework dependencies:
* `ActiveSupport::Inflector` library
* `Rack` module


## Example App

Here is an example app I built on top of this framework. [Link to the Github is here](https://github.com/sisiyao/RubyOnPilotExample).

![MusicApp preview](musicapp.png)


## Basic Setup

* Clone the repository
* Install gems with `bundle install`
* Run a local server with `ruby bin/server.rb` on `localhost:3000`


## Features & Usage

### `ModelBase` and `Associations`

`ModelBase` and `Associations` construct an object relational mapping that allows user to interact with the database. Code lives in `lib/model_base.rb`, `lib/assoc_options.rb`, `lib/assoc_options_belongsto.rb`, and `lib/assoc_options_hasmany.rb`.

To create a model, add a file under `app/models` and use the following starting code to inherit `ModelBase` functionality:

  ```Ruby
  require_relative '../../lib/model_base'

  class Album < ModelBase
    finalize!
  end
  ```

### `ControllerBase`


### Router & Routing


### `Session` & `Flash`


### CSRF Protection


### Runtime error handling

![MusicApp preview](musicapp.png)


### Static CSS Assets

## Future Improvements
