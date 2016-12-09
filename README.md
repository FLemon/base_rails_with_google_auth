# Basic Rails 5 App with Postgres + Devise + Google omniauth

## This is an application template, production ready(for HEROKU at least)

### Setup and deploy
**Heroku**
 - create app (my_app_name)
 - add-on: heroku-postgresql
 - connect to heroku CLI (`heroku git:remote -a my_app_name`)

**Google**
 - generate `GOOGLE_APP_ID` and `GOOGLE_APP_SECRET` for web application
 - add `localhost(and your production host) + /users/auth/google_oauth2/callback` authorised redirect URIs
 - add localhost(or your production host) to google oauth allowed origin

**Heroku again**
 - add ENV configs (`google_app_id`, `google_app_secret`)

**App**
 - clone/fork
 - bundle
 - find and replace `base_app_rails` with `my_app_name`
 - define(or not) `GOOGLE_APP_DOMAINS` to restrict authentication
