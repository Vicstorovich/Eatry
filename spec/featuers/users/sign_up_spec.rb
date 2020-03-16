feature 'User can sign up', %q{
  In order to user the service
  User can sign up
} do
  scenario 'User sign up' do
    visit signup_path
    fill_in "Your username please", with: "Vasia"
    fill_in "Email", with: 'user_9@mail.com'
    password = '12345678'
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Create my account"

    expect(current_path).to eq store_index_path
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

