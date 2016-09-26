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

* Clone the repository.
* Install gems with `bundle install`.
* Set up a sql file in the `config` folder. The framework currently uses SQLite3 so users must set up the database structure in a sql file. Users can rename `config/sql_file.sql` and `config/db_file.db` as long as they update the `config/db_settings.rb` file.
* Run a local server with `ruby bin/server.rb` on `localhost:3000`.


## Features & Usage

### `ModelBase and Associations`

`ModelBase` and `Associations` construct an object relational mapping that allows user to interact with the database. Code lives in `lib/model_base.rb`, `lib/assoc_options.rb`, `lib/assoc_options_belongsto.rb`, and `lib/assoc_options_hasmany.rb`.

To create a model, add a file under `app/models` and use the following starting code to inherit `ModelBase` functionality:

  ```Ruby
  require_relative '../../lib/model_base'

  class Album < ModelBase
    finalize!
  end
  ```
The database interface includes the following methods:
* all
* find
* where
* update
* save
* destroy

You can also add association methods in your models with these methods:
* belongs_to
* has_many
* has_one_through
* has_many_through

### `ControllerBase`


### `Router & Routes`


### `Session & Flash`


### `CSRF Protection`



### `Runtime error handling`

The framework has Rack middleware that will catch and display runtime errors with the error message, a stacktrace, and a preview of the error's source code. Currently functionality of this middleware does work with errors caught in `.erb` files.

![MusicApp preview](musicapp.png)


### `Static CSS Assets`

## Future Improvements

Plans for additional features include:
* Integration with PostgreSQL. Currently, functionality only works with SQLite3
* Implement a Relations class that allows method chaining and lazy evaluation for ORM methods
* Implement a 'pilot new' command similar to 'rails new'
* Turn framework into a Ruby gem
