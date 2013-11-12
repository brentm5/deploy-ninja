require 'spec_helper'

describe 'Deploy Ninja' do
  it 'displays a welcome page' do
    visit '/'
    expect(page).to have_content('Deploy Ninja')
  end
end
