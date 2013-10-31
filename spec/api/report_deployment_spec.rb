require 'spec_helper'

describe "A Deployment" do
  it "should be able to be reported" do
    deployment = build(:deployment)
    post '/deployments/new', deployment.attributes.to_json, {'Content-Type' => 'application/json'}

    expect(last_response).to be_ok

    response = JSON.parse(last_response.body)
    expect(response['deployment']['commit_sha']).to eq(deployment[:commit_sha])
  end
end
