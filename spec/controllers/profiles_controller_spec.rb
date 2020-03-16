RSpec.describe ProfilesController, type: :controller do
  describe "PATCH #update" do
    let(:user) { create(:user) }
    before { log_in(user) }

    context "with valid attributes" do
      let(:action) do
        patch :update, params: {user: {name: "new name", profile_attributes: {address: "new address"} } }
      end

      it "changes user attributes" do
        action
        user.reload
        user.profile.reload
        expect(user.name).to eq "new name"
        expect(user.profile.address).to eq "new address"
      end

      it "renders update view" do
        action
        expect(response).to redirect_to edit_profiles_path
      end
    end

    context "with invalid attributes" do
      let(:action) do
        patch :update, params: {user: {name: nil, profile_attributes: {address: nil} } }
      end

      it "does not change answer attributes" do
        expect { action }.to_not change(user.profile, :address)
        expect { action }.to_not change(user, :name)
      end

      it "renders update view" do
        action
        expect(response).to render_template :edit
      end
    end
  end
end
