require 'spec_helper'

feature 'Picture manager' do

  scenario 'User can view pictures page and pictures form' do
    visit '/'
    click_on 'all pictures'
    expect(page).to have_content 'Pictures'

    click_link 'New Picture'
    expect(page).to have_content 'URL of Picture'
    expect(page).to have_content 'Short Description'
    expect(page).to have_content 'Rating'
    find_field 'url'
    find_field 'description'
    find_field 'rating'
  end

end