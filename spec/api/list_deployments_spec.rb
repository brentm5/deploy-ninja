require 'spec_helper'

describe "Deployments" do
  it "should be able to be listed" do
    deployment = create(:deployment, tag: 'tag-tag', commit_sha: 'commit_sha')
    get '/deployments/tag-tag'

    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)
    expect(response[0]['deployment']['commit_sha']).to eq(deployment[:commit_sha])
  end
end

