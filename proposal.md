## Ruby on Pilot

### Background

Ruby on Pilot is a fleshed out version of Rails Lite and ActiveRecord Lite that will function as a lightweight MVC framework for building web apps with Ruby.

### Functionality & MVP

The Ruby on Pilot framework will have the following functionalities:

- [ ] Object relational mapping between Ruby and SQL database
- [ ] Ability to create models, controllers, and routes
- [ ] Session and flash cookies to store data on client side
- [ ] Middleware for error handling, static assets, and CSRF protection
- [ ] Ability to run a local server for the web app

### Technologies

Ruby on Pilot will be built using Ruby and Rack. The core of the project will be built on top of the Rails Lite and ActiveRecord Lite projects during the course curriculum, but will have additional and expanded bonus features including the 'has_many_through' method and ability to handle PATCH and DELETE requests.

### Implementation Timeline

**Day 1**: Polish ActiveRecord Lite and implement bonus features.  By the end of the day, I will:

- Remove all traces that ActiveRecord Lite was an AA projects and completed the associations methods that I previously did not complete
- Fully implement ORM to create models in the framework
- Fully understand each method in the ORM
- Begin writing some bonus features for the ORM (i.e. has many through, etc.)

**Day 2**: Finish up bonus features for ActiveRecord lite and begin polishing RailsLite.  By the end of the day, I will:

- Finish writing bonus features for the ORM (i.e. has many through, etc.)
- Review Rack functionality
- Fully implement functional server with Rack, basic ControllerBase, template rendering, routing, and session / flash cookies
- Fully understand each method in used to build this framework so far

**Day 3**: Implement bonus features for RailsLite and dedicate the rest of the day to integrating all parts of the MVC framework. By the end of the day, I will have:

- Ability to handle all api requests for CRUD
- Middleware for tracing errors in the stack
- Middleware for serving up static assets
- CSRF protection

**Day 4**: Test implementation all aspects of the framework. Write user instructions for how to use the framework. By the end of the day:

- Test that all methods work as intended and actually create a working web app with correct functionalities
- Production README with instructions for how to use the framework to build a web app
- BONUS: make the web app that I build with the framework more presentable to include as an example of using this framework
