def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'tommy@test.com'
  fill_in :password, with: 'test'
  click_button 'Sign Up'
end
