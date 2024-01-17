# Context for this repository
This repository is a group project for **Software Engineering II** worked on by Natitack(https://github.com/natitack) and [KameronBeamer](https://github.com/KameronBeamer). In this assignment, we were given a "genuine legacy application" in the form of a repository and were tasked with implementing robust unit, controller, and feature test coverage to practice test-driven development.

# Central Oregon COAD

This is the GitHub repository for the Central Oregon Community Organizations Active
in Disaster (COAD) help service system. It connects people in need with resources
made available by members of Community Organizations Active in Disaster.

## Development

Fork the repository:

[https://github.com/ybakos/cs362-coad-resources](https://github.com/ybakos/cs362-coad-resources)

And then clone it to your local development environment, eg:

```
git clone git@github.com:YOURFORK/cs362-coad-resources.git
```

This is a Rails application that uses SQLite in development and PostgreSQL in production.

Install the dependencies:

```
gem install bundler
bundle install
```

Next, set up the database:

```
rails db:setup
```

```
Set environment variables (see _.env.example_ for expectations):

```


If you want, you can create some seed data in the database:

```
rails db:seed
```

Start the app:

```
rails server
```

## Testing

This project uses RSpec for testing.

```
rspec
```

You can also run a specific directory of tests or file by supplying its name, like so:

```
spring rspec spec/path/to/file_spec.rb
```

## Deployment

This application uses [heroku for deployment](https://devcenter.heroku.com/articles/git).
Some useful commands to know can be found below.

Set up a heroku app to deploy to:

```
heroku git:remote -a coad-resources-staging
heroku git:remote -a coad-resources

```

Rename them _staging_ and _production_:

```
git remote rename coad-resources-staging staging
git remote rename coad-resources production

```

Deploy to a heroku app:

```
git push staging
```

Migrate the rails database of a heroku app:

```
heroku run rails db:migrate --remote staging
```

Seed the rails database of a heroku app:

```
heroku run rails db:seed --remote staging

```
heroku config:set FOO=bar
```

## Production Dependencies

PostgreSQL
Email Server (Gmail)
Recaptcha

## Data model
![erd](public/documentation/erd.jpg?raw=true)


&copy; 2020 James Martinez, Ryder McDowell. All rights reserved.
