require 'rails_helper'

RSpec.describe 'Movie Show', type: :feature do
  before (:each) do
    @user_1 = User.create!(name: 'Sam', email: 'sam.smith@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy.chan@gmail.com')
  end

  it 'shows the movie details' do
    visit "/users/#{@user_1.id}/discover"
    fill_in :search, with: 'The Lion King'
    click_button 'Search by Movie Title'
    # save_and_open_page
    click_link "The Lion King II: Simba's Pride"

    expect(page.status_code).to eq(200)
    expect(page).to have_button("Create a Viewing Party")
    expect(page).to have_link("Create a Viewing Party")
    expect(page).to have_content('The Lion King II: Simba\'s Pride')
    expect(page).to have_content#Runtime in hours and minutes
    expect(page).to have_content()
    

  end
end