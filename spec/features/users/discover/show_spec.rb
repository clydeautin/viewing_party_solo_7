require 'rails_helper'

RSpec.describe 'Discover Show', type: :feature do
  before (:each) do
    @user_1 = User.create!(name: 'Sam', email: 'sam.smith@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy.chan@gmail.com')
    visit "/users/#{@user_1.id}/discover"
  end

  #   As a user,
  # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
  # I should see
  # [x] a Button to Discover Top Rated Movies
  # [x] a text field to enter keyword(s) to search by movie title
  # [x] a Button to Search by Movie Title

  it 'I see a Button to Discover Top Rated Movies' do
    expect(page).to have_link('Discover Top Rated Movies')
  end

  it 'I see a text field to enter keyword(s) to search by movie title' do
    expect(page).to have_field('search')
  end

  it 'I see a Button to Search by Movie Title' do
    expect(page).to have_button('Search by Movie Title')
  end

#   When I visit the discover movies page ('/users/:id/discover'),
# and click on either the Discover Top Rated Movies button or fill out the movie title search and click the Search button,
# [x]I should be taken to the movies results page (`users/:user_id/movies`) where I see: 
# [x]Title (As a Link to the Movie Details page (see story #3))
# [x]Vote Average of the movie
# [x]I should also see a button to return to the Discover Page.

  it 'allows user to search for movies', :vcr do
    fill_in :search, with: 'The Lion King'
    click_button 'Search by Movie Title'
  
    expect(page.status_code).to eq(200)
    expect(page).to have_content('The Lion King')
    expect(page).to have_content('Vote average of the movie')
    expect(page).to have_button("Discover Page")
  end

  it 'displays top rated movies', :vcr do 
    click_link 'Discover Top Rated Movies'

    expect(page.status_code).to eq(200)
    expect(page).to have_css('.movie', count: 20)
    expect(page).to have_css('.title', count: 20)
    expect(page).to have_content('Vote Average', count: 20)
    expect(page).to have_link('Discover Page')
  end
end