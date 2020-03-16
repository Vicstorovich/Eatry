RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user, email: "user@mail.ru", password: "1111111", password_confirmation: "1111111") }

  describe "POST #create" do
    context "when valid email and password" do
      before { post :create, params: { session: {email: "user@mail.ru", password: "1111111"} } }
      it "it should login and redirect to home page" do
        expect(session[:user_id]).to eq user.id
        expect(response).to redirect_to store_index_path
        expect(response).to_not render_template :new
      end
    end

    context "when valid email invalind password" do
      before { post :create, params: { session: {email: "user@mail.ru", password: "2222222"} } }
      it "it should login and redirect to home page" do
        expect(session[:user_id]).to_not eq user.id
        expect(response).to_not redirect_to store_index_path
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'the user is logged in' do
      before { post :create, params: { session: {email: "user@mail.ru", password: "1111111"} } }
      it 'it is located in the system' do
        expect(session[:user_id]).to eq user.id
        expect(response).to redirect_to store_index_path
      end
    end

    context 'the user logged out' do
      before { delete :destroy, params: { session: {email: "user@mail.ru", password: "1111111"} } }
      it 'it he came out of the system' do
        expect(session[:user_id]).to_not eq user.id
        expect(response).to redirect_to root_path
      end
    end
  end
end
