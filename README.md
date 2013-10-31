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
  POST: /deployments
  parameters
    - {"tag": "silo-tag", "branch": "git-branch", "commit_sha": "lastcommitsha"}
      (optional params: errors, success)
  returns:
    - created deployment object
```

```
  GET: /deployment/:tag/last
  returns:
    - deployment object for tag
```

```
  POST: /deployments/:tag
  returns:
    - deployment objects for tag
```
