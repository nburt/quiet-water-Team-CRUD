require 'spec_helper'

feature 'homepage' do

  scenario 'user can view app name on the homepage' do
    visit '/'
    expect(page).to have_content 'Media Manager'
  end

end