# Overview
Loads up a local `webzash` web application.

## Loading it up
Clone this repository and run with `docker-compose up` then your're ready to play Webzash. 
Point your browser to `http://localhost:9010` and login with `admin/admin` credentials. 

## Creating Webzash accounts
You can either choose to create a new database when creating a new account, however you have to manually add that to your `db` service. To make it easier, you can instead use the database name and host as the Webzash installation in the `Database Settings` section but make sure to set the `Database prefix` value -- that'll save from troubles later :)


## Setting up persistent database
In your `volumes` config under the `db` service, change `/tmp/webzash-data` to your preferred folder.
```
  db: 
    ...
    volumes: 
      - "/tmp/webzash-data:/var/lib/mysql"
```
