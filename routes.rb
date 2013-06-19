# Here is my root path
get '/' do
  erb :root
end

post '/deployment' do
  content_type :json
  deployment = Deployment.new(deploy_params)
  if deployment.save
    status 200
    body({ status: 'OK'}.to_json)
    return
  end

  status 400
  body({ status: 'ERROR', errors: deployment.errors }.to_json)
end

def deploy_params
  data = JSON.parse(params['data'])

  if data
    { branch: data['branch'],
      commit_sha: data['commit'],
      successful: data['success'],
      error_summary: data['errors']
    }
  end
end
