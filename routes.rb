# Here is my root path
get '/' do
  erb :root
end

post '/deployment/new' do
  content_type :json
  deployment = Deployment.new(deploy_params)
  if deployment.save
    status 200
    body(deployment.to_json)
    return
  end

  status 400
  body({ status: 'ERROR', errors: deployment.errors }.to_json)
end

get '/deployment/last/:branch' do
  content_type :json
  deployment = Deployment.last_deploy(params[:branch])
  if deployment
    status 200
    body(deployment.to_json)
    return
  end

  status 404
  body({ status: 'ERROR', errors: 'No Results' }.to_json)
end

def deploy_params
  data = JSON.parse(request.body.read)

  if data
    { branch: data['branch'],
      commit_sha: data['commit'],
      successful: data['success'],
      error_summary: data['errors']
    }
  end
end
