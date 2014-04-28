require 'spec_helper'

feature "Picture manager" do

  scenario "User can click the 'all pictures' link" do
    visit '/'
    click_on 'all pictures'
    expect(page).to have_content "Pictures"
  end

end