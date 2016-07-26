require 'spec_helper'
# require 'database_cleaner'
#
# DatabaseCleaner.strategy = :truncation
#
# DatabaseCleaner.clean

feature 'Adding links' do
  scenario 'I can add site address and title to my bookmark manager' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.bbc.com/news'
    fill_in 'title', with: 'BBC News'
    click_button('Create Link')
    within 'ul#links' do
      expect(page).to have_content('BBC News')
    end
  end
end
