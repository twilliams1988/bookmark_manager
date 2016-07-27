require './app/models/link'

feature 'viewing list of links on homepage' do
  scenario 'the user visits the homepage' do
    Link.create(url: 'http:www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Makers Academy'
  end

    scenario 'filtering links by tag' do
      Link.create(url: 'http:www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
      Link.create(url: 'http:www.bubbles.com', title: 'Bubbles', tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http:www.bubbles2.com', title: 'Bubbles2', tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http:www.github.com', title: 'Github', tags: [Tag.first_or_create(name: 'coding')])
      visit '/tags/bubbles'
      expect(page.status_code).to eq(200)
      within 'ul#links' do
        expect(page).to have_content 'Bubbles'
        expect(page).to have_content 'bubbles2'
        expect(page).not_to have_content 'Makers Academy'
        expect(page).not_to have_content 'Github'
      end
  end
end
