require 'spec_helper'

describe 'Deployments API' do
  it 'can create a deployment' do
    deployment = attributes_for(:deployment, branch: 'helloworld')

    post '/api/deployments', deployment.to_json

    expect(response).to be_success
    expect(response_json['deployment']['branch']).to eq deployment[:branch]
  end

  it 'can return validation errors' do
    deployment = attributes_for(:deployment, branch: '')

    post '/api/deployments', deployment.to_json

    expect(response.response_code).to eq(400)
    expect(response_json['errors']).to_not eq nil
  end

  it 'can return all deployments for a tag' do
    create_list(:deployment, 2, tag: 'hello')

    get '/api/deployments/hello'

    expect(response).to be_success
    expect(response_json['deployments'].count).to eq(2)
  end

  it 'can return the last deployment for a tag' do
    create_list(:deployment, 2, tag: 'hello')
    deployment = create(:deployment, tag: 'hello', commit_sha: 'bubbles')

    get '/api/deployments/hello/last'

    expect(response).to be_success
    expect(response_json['deployment']['commit_sha']).to eq(deployment.commit_sha)
  end
end
