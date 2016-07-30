describe User do

let!(:user) do
  User.create(email: 'tommy@testy.com', password: 'qwerty', password_confirmation: 'qwerty')
end

it 'authenticates when given a correct email and password' do
  authenticated_user = User.authenticate(user.email, user.password)
  expect(authenticated_user).to eq user
end

it 'doesnt authenticate when provided incorrect password' do
  expect(User.authenticate(user.email, 'incorrect-password')).to be_nil
end

end
