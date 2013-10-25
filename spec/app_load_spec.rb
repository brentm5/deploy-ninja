require 'spec_helper'

describe "Sinatra App" do
  it "should respond to GET on root page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Deploy Ninja/)
  end
end

