require 'spec_helper'

feature 'Viewing links' do

  scenario 'homepage displays links' do
    Link.create(url: 'http://www.bbc.co.uk/news', name: 'BBC News')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('BBC News')
    end
  end

end
