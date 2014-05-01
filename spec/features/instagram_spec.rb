require 'spec_helper'

feature 'Instagram request' do

  it 'user can clicks on Instagram link and connect to Instagram site' do
    uri = URI('https://api.instagram.com')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end

