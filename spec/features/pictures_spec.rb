require 'spec_helper'

feature 'Picture manager' do

  scenario 'User can add pictures' do
    visit '/'
    click_on 'all pictures'
    expect(page).to have_content 'Pictures'

    click_link 'New Picture'
    expect(page).to have_content 'Add a picture'
    expect(page).to have_content 'URL of Picture'
    expect(page).to have_content 'Short Description'
    expect(page).to have_content 'Rating'
    fill_in 'rating', with: 5
    click_on 'Create Picture'
    expect(page).to have_content 'URL cannot be blank'
    expect(page).to have_content 'Description cannot be blank'
    fill_in 'url', with: 'http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg'
    fill_in 'description', with: 'Cool canyon photo'
    click_on 'Create Picture'
    expect(page).to have_content 'http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg'
    expect(page).to have_content 'Cool canyon photo'
    expect(page).to have_content '5'
    expect(page).to have_selector("img[src$='http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg']")
    expect(page).to have_content 'Picture successfully created'
  end

end