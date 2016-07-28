feature 'creating new user' do
  scenario 'storing a user profile' do
    visit '/user/new'
    fill_in 'name', :with => 'Aga'
    fill_in 'email', :with => 'aga@aga.com'
    fill_in 'password', :with => 'aga'
    click_button 'Save user'
    expect(page).to have_content 'Welcome, Aga'
  end
end
