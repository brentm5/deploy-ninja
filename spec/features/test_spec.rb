require 'spec_helper'

describe 'Deploy Ninja' do
  it 'displays a welcome page' do
    visit '/'
    page.should have_content 'Deploy Ninja'
  end
end
