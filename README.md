Deploy Ninja [![Build Status](https://drone.io/github.com/bigbam505/deploy-ninja/status.png)](https://drone.io/github.com/bigbam505/deploy-ninja/latest)
============

### Purpose
The purpose of this application is to keep track of deployments.  It is aimed to
be simple and only requires an http post to the server to record a deploy.  It
is aimed to be used to save deploys and then access the information via a simple
rest api.


### Technology Requirements
* PostgreSQL
* Ruby 2.0.0
* RoR

```
  POST: api/deployment
  parameters
    - {"tag": "silo-tag", "branch": "git-branch", "commit": "lastcommitsha"}
      (optional params: errors, success)
  returns:
    - created deployment object
```

```
  GET: api/deployment/:tag/last
  returns:
    - deployment object for tag
```

```
  GET: api/deployments/:tag
  returns:
    - deployment objects for tag
