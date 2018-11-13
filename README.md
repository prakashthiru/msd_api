# MSD API Rails App

MSD API Application

## System Dependencies

  * [PostgreSQL](http://www.postgresql.org/)
  * [Redis](http://redis.io/)

## Clone the repository

```
git clone https://github.com/prakashthiru/msd_api.git
```

## Install Gems
```
bundle install --local
```

## Copy sample files and edit them as appropriate
```
cp Procfile.sample Procfile

```

## Database initialization

```
bundle exec rake db:setup

```

## Start necessary services

```
foreman start
```

## Run the test suite

```
RAILS_ENV=test bundle exec rake
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
