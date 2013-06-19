Deploy Ninja
============


### Purpose
The purpose of this application is to keep track of deployments.  It is aimed to
be simple and only requires an http post to the server to record a deploy.  It
is aimed to be used to save deploys and then access the information via a simple
rest api.


### Technology Requirements
* PostgreSQL
* Ruby 2.0.0
* Sinatra

```
  POST: /deployment
  parameters
    - data: { "branch": "git-branch", "commit": "lastcommitsha"}
      (optional params: errors, success)
  returns:
    - deployment object
```

```
  GET: /deployment/last/:branch
  returns:
    - deployment object
```
