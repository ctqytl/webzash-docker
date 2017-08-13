# Overview
Loads up a local `webzash` web application.

## Loading it up
Clone this repository and run with `docker-compose up`.

You're up to play Webzash. Login with `admin / admin`. 


## Setting up persistent database
In your `volumes` config under the `db` service, change `/tmp/webzash-data` to your preferred folder.
```
  db: 
    ...
    volumes: 
      - "/tmp/webzash-data:/var/lib/mysql"
```
