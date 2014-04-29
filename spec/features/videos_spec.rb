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

    fill_in 'video_url', with: 'https://www.youtube.com/watch?v=a1Y73sPHKxw'
    click_on 'Create Video'
    expect(page).to have_content "Description cannot be blank"

    fill_in 'video_url', with: 'https://www.youtube.com/watch?v=a1Y73sPHKxw'
    fill_in 'video_description', with: 'Dramatic Hampster'
    fill_in 'video_rating', with: '5'

    click_on 'Create Video'

    expect(page).to have_content 'Video successfully created'
    expect(page).to have_content 'https://www.youtube.com/watch?v=a1Y73sPHKxw'
    expect(page).to have_content 'Dramatic Hampster'
    expect(page).to have_content '5 out of 5'

  end

end