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


## Api Documentation:
A short overview is below but you can also access
/api/spec/v1.raml
```
  POST: api/deployment
  parameters
    - {"project": "project-name", "branch": "git-branch", "commit_sha": "lastcommitsha"}
      (optional params: errors, success)
  returns:
    - created deployment object
```

```
  GET: api/projects/:project_name/deployments
  returns:
    - deployment objects for tag
```

```
  GET: api/projects/:project_name/last_deployment
  returns:
    - last deployment object for tag
