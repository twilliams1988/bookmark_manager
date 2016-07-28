require 'spec_helper'

feature 'adding tags' do
  scenario 'I can add tags to help sort and find links' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.bbc.com/'
    fill_in 'title', with: 'BBC'
    fill_in 'tags', with: 'News'
    click_button('Create Link')
    within 'ul#links' do
      expect(page).to have_content('News')

    end
  end
end
