= Weathervane

Weathervane is a rails app that provides forecasts and observations from different sources with a unified API.
This removes some of the complexity of dealing with various providers.

It is self documenting in that requesting any API action as html (IE opening it in a browser without .json extension)
will show a documentation page.

== Ruby version
tested on `Ruby(MRI) 2.1.0p0`


== System dependencies
[MongoDB](https://www.mongodb.org/) v 2.4.9

== Installation

```
git clone git@github.com:remote-wind/weathervane.git
```
[install mongodb](http://docs.mongodb.org/manual/)
```
bundle install
```

== Configuration
The development and test environments use [dotenv](https://github.com/bkeepers/dotenv) to load environment vars from a
.env file located in the root directory. This can be used to configure DB connections among other things.

See .env.dist for details.

== Testing
This app uses rspec and guard.

NB! You should start the mongodb server (`mongod`) before running specs

```
# Continuous testing
guard

# run tests once
rspec spec
```

== Deployment
This app targets the [Heroku](https://www.heroku.com/) cloud platform.