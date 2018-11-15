# MSD API Rails App

MSD API Application

## RUNNING STANDALONE

## System Dependencies

  * [Ruby](https://www.ruby-lang.org/en/)
  * [Redis](http://redis.io/)

## Clone the repository

```
git clone https://github.com/prakashthiru/msd_api.git
```

## Install Gems
```
bundle install
```

## Copy sample files and edit them as appropriate
```
cp config/msd_api.yml.sample config/msd_api.yml
cp config/redis.yml.sample config/redis.yml
cp config/secrets.yml.sample config/secrets.yml

cp Procfile.sample Procfile
```

## Generate Swagger API documentation
```
bundle exec rake swagger:docs
```

## Start necessary services

```
thin start
```

## Notes

* Configure application `host` & `port` in *msd_api.yml*
* Configure `redis` database connection in *redis.yml*
* Remove redis-server service from `Procfile` if redis is running already in your machine
* API documentaion can be accessed via `/docs` end point
* Application's health check up can done via `/health_check`

## RUNNING VIA DOCKER

## System Dependencies

  * [Docker](https://docs.docker.com/get-started/)
  * [Docker Compose](https://docs.docker.com/compose/overview/)

## Clone the repository

```
git clone https://github.com/prakashthiru/msd_api.git
```
Docker Compose file (added in this repository) includes the following images

```
* RAILS API : prakashthiru/msd_api:ver_1
* SPARK APP : prakashthiru/msd_spark:ver_1
* REDIS DB : redis:4.0.5-alpine
```

## Setup

```
sudo docker-compose up
```

## Explore the APIs

```
http://localhost:3000/docs
```

## CONTRIBUTING

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request