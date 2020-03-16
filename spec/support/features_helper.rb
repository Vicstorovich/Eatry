module FeaturesHelper
  def sign_in(user = create(:user))
    visit root_path
    click_on 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Login'
  end
end
