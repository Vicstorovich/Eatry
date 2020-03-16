RSpec.describe RegistrationsController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it "assigns a new @user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
     let(:action) { post :create, params: { user: attributes_for(:user) } }

      it 'saves a new user in the database' do
        expect { action }.to change(User, :count).by(1)
        action
        expect(response).to redirect_to store_index_path
      end
    end

    context "with invalid attributes" do
      let(:action) { post :create, params: { user: attributes_for(:user, :invalid) } }

      it "does not save the user" do
        expect { action }.to_not change(User, :count)
      end

      it "re-renders new view" do
        action
        expect(response).to render_template :new
      end
    end
  end
end

