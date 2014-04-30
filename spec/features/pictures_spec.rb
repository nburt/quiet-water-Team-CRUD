require 'spec_helper'

feature 'Picture manager' do

  before do
    visit '/pictures/new'
    expect(page).to have_content 'Add a picture'
    fill_in 'url', with: 'http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg'
    fill_in 'description', with: 'Cool canyon photo'
    fill_in 'rating', with: 5
    click_on 'Create Picture'
  end

  scenario 'User can add pictures' do
    expect(page).to have_content 'http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg'
    expect(page).to have_content 'Cool canyon photo'
    expect(page).to have_content '5'
    expect(page).to have_selector("img[src$='http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg']")
    expect(page).to have_content 'Picture successfully created'
  end

  scenario 'User sees error messages if they don\'t fill in the url or description fields' do
    visit '/pictures'
    click_link 'New Picture'
    fill_in 'rating', with: 5
    click_on 'Create Picture'
    expect(page).to have_content 'URL cannot be blank'
    expect(page).to have_content 'Description cannot be blank'
  end

  scenario 'User can see all pictures' do
    visit '/pictures/new'
    expect(page).to have_content 'Add a picture'
    fill_in 'url', with: 'http://i1095.photobucket.com/albums/i469/azrie1/music/ItsGonnaBeMe.jpg'
    fill_in 'description', with: "Cool 'NSync photo"
    fill_in 'rating', with: 5
    click_on 'Create Picture'
    id = current_path.match(/\d$/)
    click_link 'all pictures'
    expect(page).to have_selector("img[src$='http://i0006.photobucket.com/albums/0006/findstuff22/Best%20Images/Animals/6a81f2da.jpg']")
    expect(page).to have_selector("img[src$='http://i1095.photobucket.com/albums/i469/azrie1/music/ItsGonnaBeMe.jpg']")
    within '#images' do
      page.first('a').click
    end
    url = current_url
    expect(page).to have_content "Cool canyon photo"

    visit url
    click_on 'Edit'
    fill_in 'description', with: 'Not cool canyon photo'
    click_on 'Update Picture'
    click_link 'all pictures'
    visit url
    expect(page).to have_content 'Not cool canyon photo'
    expect(page).to_not have_content "Cool canyon photo"

    visit url
    click_on 'Edit'
    fill_in 'url', with: ''
    fill_in 'description', with: ''
    fill_in 'rating', with: 5
    click_on 'Update Picture'
    expect(page).to have_content 'URL cannot be blank'
    expect(page).to have_content 'Description cannot be blank'

  end

  scenario "User can delete a picture" do

    visit '/'
    click_on 'all pictures'
    click_on 'New Picture'

    fill_in 'url', with: 'http://i1095.photobucket.com/albums/i469/azrie1/music/ItsGonnaBeMe.jpg'
    fill_in 'description', with: 'Cool canyon photo'
    fill_in 'rating', with: '5'
    click_on 'Create Picture'

    click_on 'Delete Picture'

    expect(page).to_not have_selector("img[src$='http://i1095.photobucket.com/albums/i469/azrie1/music/ItsGonnaBeMe.jpg']")

  end

end