require 'spec_helper'

describe "Deploy Ninja application root" do
  it "should respond with help page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Deploy Ninja/)
  end
end

