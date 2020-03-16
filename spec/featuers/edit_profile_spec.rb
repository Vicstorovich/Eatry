feature "As a user I can edit my profile" do
  given(:user) { create(:user) }

  describe "Authenticated user" do
    background do
      sign_in(user)

      click_on "Edit profile"
    end

  scenario "edit my profile valid content" do
      fill_in "Name", with: "Petro"
      fill_in "Address", with: "Mosckow"
      click_on "Save"

      expect(page).to have_content "The profile was updated successfully"
    end

  scenario "edit my profile invalid content" do
      fill_in "Name", with: "Petro"
      fill_in "Address", with: ""
      click_on "Save"

      expect(page).to have_content "The profile not updated"
    end
  end
end
