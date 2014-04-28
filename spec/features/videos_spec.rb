require 'spec_helper'

feature 'Video manager' do

  scenario 'User can click the all videos link' do
    visit '/'
    click_on 'all videos'
    expect(page).to have_content 'Videos'
  end

  scenario 'User can view a form to add a new video' do
    visit '/'
    click_on 'all videos'
    click_on 'New Video'

    expect(page).to have_content 'Video URL'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Rating'

  end

end