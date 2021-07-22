# README [![CircleCI](https://circleci.com/gh/pulibrary/notebook/tree/testing.svg?style=svg)](https://circleci.com/gh/pulibrary/notebook/tree/testing)

Simple notebook app using Ruby on Rails and PostgreSQL for final checkpoint project.

### Development

#### Dependencies Setup
* Install Lando from https://github.com/lando/lando/releases (at least 3.x)

```sh
bundle install
```

#### Starting / stopping services
We use lando to run services required for both test and development environments.

Start and initialize database services with `rake servers:start`

To stop database services: `rake servers:stop` or `lando stop`

#### Run tests
`bundle exec rspec`

#### Start development server
- `bundle exec rails s`
- Access application at http://localhost:3000/subjects