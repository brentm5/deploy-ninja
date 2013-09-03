# Here is my root path
get '/' do
  erb :root
end

post '/deployments/new' do
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

get '/deployments/:tag/last' do
  content_type :json
  deployment = Deployment.last_deploy(params[:tag])
  if deployment
    status 200
    body(deployment.to_json)
    return
  end

  status 404
  body(no_results_error)
end


get '/deployments/:tag' do
  content_type :json
  deployments = Deployment.deploys(params[:tag])
  if deployments.any?
    status 200
    body(deployments.to_json)
    return
  end

  status 404
  body(no_results_error)
end

def no_results_error
  { status: 'ERROR', errors: 'No Results' }.to_json
end

def deploy_params
  data = JSON.parse(request.body.read)

  if data
    { tag: data['tag'],
      branch: data['branch'],
      commit_sha: data['commit'],
      successful: data['success'],
      error_summary: data['errors']
    }
  end
end
