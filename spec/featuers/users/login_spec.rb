feature "User can sign in", %q{
  In order to ask questions
  As an unauthenticated user
  I'd like to be able to sign in
} do
  given(:user) { create(:user) }

  background { visit login_path }

  scenario "Registered user tries to sign in" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "Unregistered user tries to sign in" do
    fill_in "Email", with: "wrong@test.com"
    fill_in "Password", with: "12345678"
    click_on "Login"

    expect(page).to have_content "Verify your Email and Password, please."
  end
end
