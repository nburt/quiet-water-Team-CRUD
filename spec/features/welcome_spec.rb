require 'spec_helper'

feature 'homepage' do

  scenario 'user can view app name on the homepage' do
    visit '/'
    expect(page).to have_content 'Media Manager'
    expect(page).to have_content 'Welcome to the media manager, where you can, well... manage media.'

    within '#show_left' do
      click_on 'View All'
    end
    expect(page).to have_content 'Pictures'

    visit '/'

    within '#show_right' do
      click_on 'View All'
    end
    expect(page).to have_content 'Videos'
  end

  scenario 'a user can see the Instagram link' do
    visit '/'
    within '#show_left'do
      expect(page).to have_content 'Instagram!'
      click_link 'View Instagram Photos'
    end
    expect(page).to have_content 'Instagram Photos'
  end

end