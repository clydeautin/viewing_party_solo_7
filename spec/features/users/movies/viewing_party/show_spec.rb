require 'rails_helper'

RSpec.describe 'Viewing Party Show Page', type: :feature do
  before(:each) do
    @user_1 = User.create!(name: 'Sam', email: 'sam.smith@email.com')
    visit "/users/#{@user_1.id}/movies/9732/viewing_party/new"
    fill_in 'date', with: '2024-07-07'
    fill_in 'start_time', with: '11:30'
    click_button 'Create Viewing Party'
    visit "/users/#{@user_1.id}/movies/9732/viewing_party/#{ViewingParty.last.id}"
  end

  it 'shows logos and details of the viewing party' do

    expect(page).to have_css('.buy-provider-logo')
    expect(page).to_not have_css('.rent-provider-logo')

    expect(page).to have_content('Buy/Rent data provided by JustWatch')
  end
end