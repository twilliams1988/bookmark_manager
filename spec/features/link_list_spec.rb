feature 'viewing list of links on homepage' do
  scenario 'the user visits the homepage' do
    Link.create(url: 'http:www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Makers Academy'
  end
end
