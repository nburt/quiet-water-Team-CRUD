require 'spec_helper'

feature 'Video manager' do

  scenario 'User can click the all videos link' do
    visit '/'
    click_on 'all videos'
    expect(page).to have_content 'Videos'
  end

end