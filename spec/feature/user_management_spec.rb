feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, tommy@test.com')
    expect(User.first.email).to eq('tommy@test.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'user is alerted when passwords do not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cant sign up with a blank email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cant sign up with invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'a user cant sign up with an existing email address' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  def sign_up(email: 'tommy@test.com', password: '12345678', password_confirmation: '12345678')
    visit 'users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
end

feature 'user sign in' do
  let!(:user) do
    User.create(email: 'tommy@testy.com', password: 'qwerty', password_confirmation: 'qwerty')
  end

  scenario 'user logs in with correct details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{user.email}")
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

end
