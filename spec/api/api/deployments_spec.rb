require 'spec_helper'

describe 'Deployments API' do
  it 'can create a deployment' do
    deployment = attributes_for(:deployment, branch: 'helloworld')

    post '/api/deployments', deployment.to_json, {"Content-Type" =>  "application/json" }

    expect(response).to be_success
    expect(response_json['deployment']['branch']).to eq deployment[:branch]
  end

  it 'can return validation errors' do
    deployment = attributes_for(:deployment, branch: '')

    post '/api/deployments', deployment.to_json

    expect(response.response_code).to eq(400)
    expect(response_json['errors']).to_not eq nil
  end

  it 'can return all deployments for a project' do
    create_list(:deployment, 2, project: 'hello')

    get '/api/projects/hello/deployments'

    expect(response).to be_success
    expect(response_json['deployments'].count).to eq(2)
  end

  it 'can return the last deployment for a project' do
    create_list(:deployment, 2, project: 'hello')
    deployment = create(:deployment, project: 'hello', commit_sha: 'bubbles')

    get '/api/projects/hello/last_deployment'

    expect(response).to be_success
    expect(response_json['deployment']['commit_sha']).to eq(deployment.commit_sha)
  end
end
