feature 'creating new link' do
  scenario 'user adds new link to bookmark manager' do
    visit 'links/new'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    fill_in 'title', :with => 'Makers Academy'
    click_button 'Save link'
    expect(page). to have_content ' Makers Academy'
  end
end
